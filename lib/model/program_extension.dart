import 'package:routine_manager/model/program.dart';
import 'package:routine_manager/model/session.dart';
import 'package:routine_manager/model/session_extension.dart';

extension ProgramExtension on Program {
  Program progressProgram(Session? selectedSession) {
    return this.copyWith(
      progressedProgramTimeInSeconds: progressedProgramTimeInSeconds + 1,
      programSessions: programSessions
          .map((session) => session.sessionUid == selectedSession?.sessionUid
              ? session.progressSession()
              : session)
          .toList(),
    );
  }

  bool isAllSessionCompleted() =>
      programSessions.every((session) => session.isSessionCompleted);

  bool isProgramTimedOut() =>
      programTimeInSeconds == progressedProgramTimeInSeconds;

  bool isOverExpectedEndTime() =>
      startedAt
          ?.add(Duration(seconds: this.programTimeInSeconds))
          .isBefore(DateTime.now()) ??
      false;

  int get programRemainingTime =>
      programTimeInSeconds - progressedProgramTimeInSeconds;

  // 전체 잔여시간
  int get totalRestTime =>
      programTimeInSeconds -
      programSessions.fold(
          0,
          (previousValue, session) =>
              previousValue + session.sessionTimeInSeconds);

  // 남은 잔여시간 = 전체 잔여시간 - (세션 진행시간 합 - 프로그램 진행시간)
  int get remainingRestTime => programSessions.fold(
              0,
              (previousValue, session) =>
                  previousValue + session.progressedSessionTimeInSeconds) <
          progressedProgramTimeInSeconds
      ? totalRestTime -
          (progressedProgramTimeInSeconds -
              programSessions.fold(
                  0,
                  (previousValue, session) =>
                      previousValue + session.progressedSessionTimeInSeconds))
      : totalRestTime;

  Session? getPrioritySessionInRemaining() {
    final remainingSessions =
        programSessions.where((session) => !session.isSessionCompleted);
    if (remainingSessions.isEmpty) return null;
    if (remainingSessions.length == 1) return remainingSessions.first;
    return remainingSessions.reduce((before, after) =>
        before.sessionPriority < after.sessionPriority ? before : after);
  }
}
