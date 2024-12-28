import 'package:routine_manager/model/program_extension.dart';
import 'package:routine_manager/model/session.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';
import '../../model/program.dart';
import '../../model/program_history.dart';
import '../../model/session_history.dart';
import '../../data/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final db = TempDataSource();
  @override
  Future<void> saveProgram(Program program) async {
    await db.create(
        tableName: 'program', data: program, dataUid: program.programUid);
  }

  @override
  Future<List<Program>> getAllPrograms() async {
    return (await db.readAll(tableName: 'program'))
        .map((e) => e as Program) // ## 오류 수정 불요. db 붙이며 수정할 것.
        .toList();
  }

  // history의 crud는 programhistory 테이블, sessionhistory 테이블 두 테이블에서 실시.

  Future<SessionHistory> getSessionHistory(String programHistoryUid) async {
    return await db.read(
      tableName: 'session_history',
      dataUid: programHistoryUid,
    ) as SessionHistory;
  }

  @override
  Future<ProgramHistory?> readProgramHistory(String programUid) async {
    try {
      return await db.read(
        tableName: 'program_history',
        dataUid: programUid,
      ) as ProgramHistory;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> createHistory(Program program) async {
    if (program.programHistoryUid == null || program.startedAt == null) {
      throw Exception('ProgramHistoryUid || startedAt is null');
    }
    final newProgramHistory = ProgramHistory(
      historyUid: program.programHistoryUid!,
      programUid: program.programUid,
      startedAt: program.startedAt!,
      endedAt: null,
      totalProgressedTimeInSeconds: program.progressedProgramTimeInSeconds,
    );

    await db.create(
      tableName: 'program_history',
      data: newProgramHistory,
      dataUid: newProgramHistory.historyUid,
    );

    // 각 세션에 대한 히스토리 생성
    for (final session in program.programSessions) {
      final sessionHistory = SessionHistory(
        sessionHistoryUid: const Uuid().v4(),
        programHistoryUid: newProgramHistory.historyUid,
        sessionUid: session.sessionUid,
        progressedTimeInSeconds: 0,
      );

      await db.create(
        tableName: 'session_history',
        data: sessionHistory,
        dataUid: sessionHistory.sessionHistoryUid,
      );
    }
  }

  @override
  Future<void> updateHistory(
      {required Program program, DateTime? endedAt}) async {
    if (program.programHistoryUid == null || program.startedAt == null) {
      throw Exception('ProgramHistoryUid || startedAt is null');
    }

    final newProgramHistory = ProgramHistory(
      historyUid: program.programHistoryUid!,
      programUid: program.programUid,
      startedAt: program.startedAt!,
      endedAt: endedAt,
      totalProgressedTimeInSeconds: program.progressedProgramTimeInSeconds,
    );

    await db.update(
      tableName: 'program_history',
      data: newProgramHistory,
      dataUid: newProgramHistory.historyUid,
    );

    final List<SessionHistory> sessionHistories = await db.readAllWithQuery(
      tableName: 'session_history',
      query: (data) => data.programHistoryUid == newProgramHistory.historyUid,
    ) as List<SessionHistory>;

    // 각 세션 히스토리 업데이트
    for (final session in program.programSessions) {
      final savedSessionHistory = sessionHistories.firstWhere(
        (data) => data.sessionUid == session.sessionUid,
      );

      final newSessionHistory = savedSessionHistory.copyWith(
        progressedTimeInSeconds: session.progressedSessionTimeInSeconds,
        sessionMemo: session.sessionMemo,
      );

      await db.update(
        tableName: 'session_history',
        data: newSessionHistory,
        dataUid: newSessionHistory.sessionHistoryUid,
      );
    }
  }

  @override
  Future<List<ProgramHistory>> readProgramHistories(String programUid) async {
    return await db.readAllWithQuery(
      tableName: 'program_history',
      query: (data) => data.programUid == programUid,
    ) as List<ProgramHistory>;
  }

  @override
  Future<List<SessionHistory>> readSessionHistories(
      String programHistoryUid) async {
    return await db.readAllWithQuery(
      tableName: 'session_history',
      query: (data) => data.programHistoryUid == programHistoryUid,
    ) as List<SessionHistory>;
  }

  @override
  Future<void> deleteProgram(Program program) async {
    // 프로그램 삭제
    await db.delete(tableName: 'program', dataUid: program.programUid);

    // 하기 내용도 db 붙이며 작업할 것
    // 세션 삭제
    // 프로그램, 세션 히스토리 삭제
  }
}

class TempDataSource {
  static final Map<String, Map> _localDB = {
    'program': <String, Program>{},
    'session': <String, Session>{},
    'program_history': <String, ProgramHistory>{},
    'session_history': <String, SessionHistory>{},
  };

  // 현재 dataUid를 PK로 사용하고 있음
  Future<String> create(
      {required String tableName,
      required dynamic data,
      String? dataUid}) async {
    if (!_localDB.containsKey(tableName)) {
      throw Exception('Table $tableName does not exist');
    }
    final String uid = dataUid ?? const Uuid().v4();
    _localDB[tableName]![uid] = data;
    talker.warning('datasource/create -> $tableName: $uid');
    return uid;
  }

  Future<dynamic> read({
    required String tableName,
    required String dataUid,
  }) async {
    if (!_localDB.containsKey(tableName) ||
        !_localDB[tableName]!.containsKey(dataUid)) {
      throw Exception(
          'Table $tableName does not exist or data with uid $dataUid does not exist');
    }

    talker.warning('datasource/read -> dataUid: $dataUid');
    talker.warning('datasource/read -> ${_localDB[tableName]}');
    return _localDB[tableName]![dataUid];
  }

  // 쿼리 read
  Future<List<dynamic>> readAllWithQuery({
    required String tableName,
    required Function(dynamic) query, // 쿼리 조건을 function으로 받음
  }) async {
    final result = _localDB[tableName]!.values.where((e) => query(e)).toList();
    talker.warning('datasource/readAllWithQuery -> $tableName: $result');
    return result;
  }

  Future<List<dynamic>> readAll({
    required String tableName,
  }) async {
    talker.warning('datasource/readAll -> $tableName: ${_localDB[tableName]}');
    return _localDB[tableName]!.values.toList();
  }

  Future<String> update({
    required String tableName,
    required dynamic data,
    required String dataUid,
  }) async {
    if (!_localDB.containsKey(tableName) ||
        !_localDB[tableName]!.containsKey(dataUid) ||
        _localDB[tableName]!.isEmpty) {
      throw Exception(
          'Table $tableName does not exist or data with uid $dataUid does not exist');
    }
    _localDB[tableName]![dataUid] = data;
    talker.warning('datasource/update -> $tableName: $dataUid');
    return dataUid;
  }

  Future<void> delete(
      {required String tableName, required String dataUid}) async {
    if (!_localDB.containsKey(tableName) ||
        !_localDB[tableName]!.containsKey(dataUid)) {
      throw Exception(
          'Table $tableName does not exist or data with uid $dataUid does not exist');
    }
    _localDB[tableName]!.remove(dataUid);
    talker.warning('datasource/delete -> $tableName: $dataUid');
  }
}
