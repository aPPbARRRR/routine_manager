import 'package:routine_manager/model/program_extension.dart';
import 'package:routine_manager/model/program_history.dart';

import '../model/program.dart';
import '../model/session.dart';
import '../model/session_history.dart';
import '../data/repository/app_repository.dart';
import 'app_service.dart';

class AppServiceImpl implements AppService {
  AppServiceImpl({required this.repository});

  final AppRepository repository;

  @override
  Future<List<Program>> getSavedPrograms() {
    return repository.getAllPrograms();
  }

  @override
  Future<void> saveProgram(Program program) async {
    await repository.saveProgram(program);
  }

  @override
  Future<void> saveHistory({required Program program}) async {
    if (program.programHistoryUid == null || program.startedAt == null) {
      throw Exception('ProgramHistoryUid is null');
    }

    // 프로그램 예정 종료 시간
    final DateTime expectedEndTime =
        program.startedAt!.add(Duration(seconds: program.programTimeInSeconds));

    // 업데이트는 프로그램 실행중에 실시. 마지막 종료 시점에도 업데이트.
    // 생성은 프로그램 실행시에만 실시.

    // 해당 프로그램의 저장시점은 5가지 경우로 나뉨.
    // 1. 프로그램 실행 시작 시
    // 2. 프로그램 실행 중
    // 3. 프로그램 시간 만료 전 && 전 세션 만료
    // 4. 프로그램 시간 만료로 인한 종료 시
    // 5. 외부 요인으로 프로그램 중단 후 재개시 시점이 프로그램 시간 만료 이후일 때
    // 1 -> 5 -> 4 -> 3 -> 2 순으로 차례대로 확인해야함.

    // 프로그램 히스토리가 존재하는지 확인
    final savedProgramHistory =
        await repository.readProgramHistory(program.programHistoryUid!);

    // 히스토리 없는 경우. 즉, 프로그램 실행 시작시 이므로 create
    if (savedProgramHistory == null) {
      await repository.createHistory(program);
    }

    // 이하 히스토리 존재하는 경우. 즉, 프로그램이 실행중인 경우이므로 update
    else if (DateTime.now().isAfter(expectedEndTime)) {
      // 4번의 경우
      await repository.updateHistory(
          program: program, endedAt: expectedEndTime);
    } else if (program.isProgramTimedOut()) {
      // 3번의 경우
      await repository.updateHistory(
          program: program, endedAt: expectedEndTime);
    } else if (program.isAllSessionCompleted()) {
      // 2번의 경우
      await repository.updateHistory(
          program: program,
          endedAt: program.startedAt!
              .add(Duration(seconds: program.progressedProgramTimeInSeconds)));
    } else {
      // 1번의 경우
      await repository.updateHistory(program: program);
    }
  }

  @override
  Future<List<ProgramHistory>> getProgramHistoryCollection(
      String programUid) async {
    return await repository.readProgramHistories(programUid);
  }

  @override
  Future<List<SessionHistory>> getSessionHistoryCollection(
      String programHistoryUid) async {
    return await repository.readSessionHistories(programHistoryUid);
  }

  @override
  Future<void> removeProgram(Program program) async {
    await repository.deleteProgram(program);
  }
}
