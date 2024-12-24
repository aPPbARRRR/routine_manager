import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routine_manager/model/program.dart';
import 'package:routine_manager/model/program_extension.dart';
import 'package:routine_manager/model/session_extension.dart';
import 'package:routine_manager/presentation/constant/window_size.dart';
import 'package:routine_manager/presentation/widget/write_text_dialog.dart';
import 'package:routine_manager/service/app_service.dart';
import 'package:uuid/uuid.dart';

import '../../model/session.dart';

part 'progressing_program_collection.g.dart';

// # todo
// 현재 타이머 실행 방식 -> 리버팟 이용하여 program을 state로 하여 매번 새로운 program을 생성하여 화면을 최신화.
// 현재 타이머 실행 방식때문에 기존 program과 동일해야하는 program이 다른 instance로 생성됨.
// program의 extension으로 메소드들을 구현해놓은 설계와 배치되는 방식임.
// 개선할 것.

@Riverpod(keepAlive: true)
class ProgressingProgramCollection extends _$ProgressingProgramCollection {
  @override
  List<Program> build() {
    return [];
  }

  late final AppService appService = ref.read(appServiceProvider);

  Session? getSelectedSession(String programUid) =>
      _selectedSessions[programUid];

  Map<String, Session?> _selectedSessions = {};
  Map<String, Timer?> _programRunners = {};

  void runProgram(Program program, BuildContext context) {
    if (state.where((p) => p.programUid == program.programUid).isNotEmpty) {
      return;
    }

    final programWithHistory = program.copyWith(
      programHistoryUid: const Uuid().v4(),
      startedAt: DateTime.now(),
    );

    appService.saveHistory(program: programWithHistory);

    state = [...state, programWithHistory]; // rebuild

    _selectSession(programWithHistory);

    // 타이머 등록 및 시작
    _programRunners[programWithHistory.programUid] =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      final targetProgram = state
          .firstWhere((p) => p.programUid == programWithHistory.programUid);
      // 프로그램 시간 경과시 프로그램 종료
      if (targetProgram.isProgramTimedOut()) {
        _terminateProgram(targetProgram);
        return;
      }

      if (targetProgram.isOverExpectedEndTime()) {
        appService.saveHistory(program: targetProgram);
        _terminateProgram(targetProgram);
        return;
      }

      // 프로그램 진행
      final progressedProgram = targetProgram
          .progressProgram(_selectedSessions[targetProgram.programUid]);
      // 프로그램 히스토리 저장, await 불요
      if (timer.tick % 10 == 0) {
        appService.saveHistory(program: progressedProgram);
      }

      if (_selectedSessions[targetProgram.programUid] != null) {
        // 셀렉티드 섹션이 널이 아닐 때만 실행.
        // 선택된 세션 완료 시 다음 세션 선택
        if (progressedProgram.programSessions
            .firstWhere((session) =>
                session.sessionUid ==
                _selectedSessions[targetProgram.programUid]?.sessionUid)
            .isSessionCompleted) {
          _selectSession(progressedProgram);
        }
      } else {
        // 선택된 섹션이 없을 때(rest 소모중)
        // 남은 rest 시간 없어도 그대로 프로그램 진행. 즉, 프로그램 시간만 소요되고, 잔여 시간은 모두 소모 후 음수로 전환
        // 해당 else 구문에서 따로 수행할 것은 현재 없음.
      }

      // 상태 최신화
      if (state
          .where((p) => p.programUid == targetProgram.programUid)
          .isNotEmpty) {
        state = [
          ...state.where((p) => p.programUid != targetProgram.programUid),
          progressedProgram
        ];
      }
    });
  }

  void _selectSession(Program program) =>
      program.isAllSessionCompleted() // 만약 모든 세션의 남은 시간이 0인 경우 프로그램 종료
          ? _terminateProgram(program)
          : _selectedSessions[program.programUid] =
              program.getPrioritySessionInRemaining();

  void setSelectedSession(Program program, Session? session) {
    _selectedSessions[program.programUid] = session;
    state = [...state]; // rebuild
  }

  Future<void> _terminateProgram(Program program) async {
    _programRunners[program.programUid]?.cancel();
    _selectedSessions.remove(program.programUid);
    state = [...state.where((p) => p.programUid != program.programUid)];
  }

  void updateSessionMemo(Session session, String memo) {
    final program = state.firstWhere((program) =>
        program.programSessions.any((s) => s.sessionUid == session.sessionUid));
    final updatedProgram = program.copyWith(
      programSessions: program.programSessions
          .map((s) => s.sessionUid == session.sessionUid
              ? session.copyWith(sessionMemo: memo)
              : s)
          .toList(),
    );
    state = [
      ...state.where((p) => p.programUid != program.programUid),
      updatedProgram
    ];
  }

  Future<void> stopProgram(Program program) async {
    final targetProgram =
        state.firstWhere((p) => p.programUid == program.programUid);

    await appService.saveHistory(program: targetProgram);

    await _terminateProgram(program);
  }

  bool isThisProgramRunning(Program program) =>
      state.where((p) => p.programUid == program.programUid).isNotEmpty;

  // void terminate(String programUid) {
  //   state = state.where((p) => p.programUid != programUid).toList();
  // }

  void showProgramDescriptionDialog(Program program, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => WriteTextDialog(
        initialText: program.programDescription,
        fontSize: 16,
        textFieldHeight: WindowSize.currentSize.height.toInt() - 128,
        isReadOnly: true,
      ),
    );
  }
}
