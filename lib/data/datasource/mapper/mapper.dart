import 'package:drift/drift.dart';

import '../../../model/program.dart';
import '../../../model/program_history.dart';
import '../../../model/session.dart';
import '../../../model/session_history.dart';
import '../database/app_database.dart';

extension ProgramDbMapper on Program {
  ProgramDtosCompanion toCompanion() {
    return ProgramDtosCompanion(
      programUid: Value(programUid),
      programTitle: Value(programTitle),
      programDescription: Value(programDescription),
      startedAt: Value(startedAt),
      programTimeInSeconds: Value(programTimeInSeconds),
      progressedProgramTimeInSeconds: Value(progressedProgramTimeInSeconds),
      programHistoryUid: Value(programHistoryUid),
    );
  }

  static Program fromDto(ProgramDto dto, List<Session> sessions) => Program(
      programTitle: dto.programTitle,
      programUid: dto.programUid,
      programDescription: dto.programDescription,
      programTimeInSeconds: dto.programTimeInSeconds,
      progressedProgramTimeInSeconds: dto.progressedProgramTimeInSeconds,
      programSessions: sessions);
}

extension ProgramHistoryDbMapper on ProgramHistory {
  ProgramHistoryDtosCompanion toCompanion() {
    return ProgramHistoryDtosCompanion(
      programHistoryUid: Value(historyUid),
      programUid: Value(programUid),
      startedAt: Value(startedAt),
      endedAt: Value(endedAt),
      totalProgressedTimeInSeconds: Value(totalProgressedTimeInSeconds),
    );
  }

  static ProgramHistory fromDto(ProgramHistoryDto dto) => ProgramHistory(
        historyUid: dto.programHistoryUid,
        programUid: dto.programUid,
        startedAt: dto.startedAt,
        endedAt: dto.endedAt,
        totalProgressedTimeInSeconds: dto.totalProgressedTimeInSeconds,
      );
}

extension SessionDbMapper on Session {
  SessionDtosCompanion toCompanion() {
    return SessionDtosCompanion(
      progressedSessionTimeInSeconds: Value(progressedSessionTimeInSeconds),
      sessionUid: Value(sessionUid),
      programUid: Value(programUid),
      sessionTitle: Value(sessionTitle),
      sessionTimeInSeconds: Value(sessionTimeInSeconds),
      sessionMemo: Value(sessionMemo),
      sessionPriority: Value(sessionPriority),
    );
  }

  static Session fromDto(SessionDto dto) => Session(
        programUid: dto.programUid,
        sessionUid: dto.sessionUid,
        sessionTitle: dto.sessionTitle,
        sessionTimeInSeconds: dto.sessionTimeInSeconds,
        progressedSessionTimeInSeconds: dto.progressedSessionTimeInSeconds,
        sessionMemo: dto.sessionMemo,
        sessionPriority: dto.sessionPriority,
      );
}

extension SessionHistoryDbMapper on SessionHistory {
  SessionHistoryDtosCompanion toCompanion() {
    return SessionHistoryDtosCompanion(
      sessionHistoryUid: Value(sessionHistoryUid),
      sessionUid: Value(sessionUid),
      programHistoryUid: Value(programHistoryUid),
      progressedTimeInSeconds: Value(progressedTimeInSeconds),
      sessionMemo: Value(sessionMemo),
    );
  }

  static SessionHistory fromDto(SessionHistoryDto dto) => SessionHistory(
        sessionHistoryUid: dto.sessionHistoryUid,
        sessionUid: dto.sessionUid,
        programHistoryUid: dto.programHistoryUid,
        progressedTimeInSeconds: dto.progressedTimeInSeconds,
        sessionMemo: dto.sessionMemo,
      );
}
