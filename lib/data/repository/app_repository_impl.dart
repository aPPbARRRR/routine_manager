import 'package:routine_manager/data/datasource/mapper/mapper.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';
import '../../model/program.dart';
import '../../model/program_history.dart';
import '../../model/session.dart';
import '../../model/session_history.dart';
import '../datasource/database/app_database.dart';

import 'app_repository.dart';

/// ##
/// repository에서 직접 db에 접근하여 crud 처리. transaction까지 담당.
///
/// ##
/// 반복문은 for-in 문으로 처리. Future.wait/forEach 사용x
///   - drift가 어떤 방식으로 트랜잭션을 처리하는지 명확하지 않음. 오류처리 등에서 문제 발생시 파악 어려움 예상
///   - 데이터 양 자체가 많지 않고, 빠르게 처리하거나 동시처리를 할 이점이 크지 않음
///   - ## : 속도 중요해지면 Future.wait 사용으로 수정.
///
/// ## 필요시 update
/// - 필요시 pagination 구현. 현재 pagination 구현 x. 속도 테스트 x.

class AppRepositoryImpl implements AppRepository {
  final database = AppDatabase();
  // final db = TempDataSource();
  @override
  Future<void> saveProgram(Program program) async {
    await database.transaction(() async {
      await database.programDao.createProgramDto(program.toCompanion());
      for (final session in program.programSessions) {
        await database.sessionDao.createSessionDto(session.toCompanion());
      }
    });
  }

  @override
  Future<List<Program>> getAllPrograms() async {
    try {
      final programDtos = await database.programDao.readAllProgramDtos;
      final sessionDtos = await database.sessionDao.readAllSessionDtos;
      final sessions = sessionDtos
          .map((sessionDto) => SessionDbMapper.fromDto(sessionDto))
          .toList();
      final programs = programDtos
          .map((programDto) => ProgramDbMapper.fromDto(
              programDto,
              sessions
                  .where(
                      (session) => session.programUid == programDto.programUid)
                  .toList()))
          .toList();
      return programs;
    } catch (e) {
      throw Exception(e);
    }
  }

  // 프로그램 히스토리 uid로 프로그램 히스토리 조회
  @override
  Future<ProgramHistory?> readProgramHistory(String programHistoyUid) async {
    try {
      return ProgramHistoryDbMapper.fromDto(await database.programHistoryDao
          .readProgramHistoryDtoByProgramHistoryUid(programHistoyUid));
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
    final newSessionHistories =
        program.programSessions.map((session) => SessionHistory(
              sessionHistoryUid: const Uuid().v4(),
              programHistoryUid: newProgramHistory.historyUid,
              sessionUid: session.sessionUid,
              progressedTimeInSeconds: session.progressedSessionTimeInSeconds,
              sessionMemo: session.sessionMemo,
            ));

    try {
      await database.transaction(() async {
        await database.programHistoryDao
            .createProgramHistoryDto(newProgramHistory.toCompanion());
        for (final sessionHistory in newSessionHistories) {
          await database.sessionHistoryDao
              .createSessionHistoryDto(sessionHistory.toCompanion());
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateHistory(
      {required Program program, DateTime? endedAt}) async {
    if (program.programHistoryUid == null || program.startedAt == null) {
      throw Exception('ProgramHistoryUid || startedAt is null');
    }

    try {
      await database.transaction(() async {
        final newProgramHistory = ProgramHistory(
            historyUid: program.programHistoryUid!,
            programUid: program.programUid,
            startedAt: program.startedAt!,
            endedAt: endedAt,
            totalProgressedTimeInSeconds:
                program.progressedProgramTimeInSeconds);
        await database.programHistoryDao
            .updateProgramHistoryDto(newProgramHistory.toCompanion());

        // update는 각 entity의 pk 일치 조건으로 수행되기 때문에, pk 얻기 위해 저장된 SessionHistories를 먼저 read
        final pastSessionHistories = await database.sessionHistoryDao
            .readSessionHistoryDtosByProgramHistoryUid(
                program.programHistoryUid!);
        for (final sessionHistory in pastSessionHistories) {
          final newSession = program.programSessions.firstWhere(
              (session) => session.sessionUid == sessionHistory.sessionUid);
          final newSessionHistory = SessionHistory(
            sessionHistoryUid: sessionHistory.sessionHistoryUid,
            programHistoryUid: sessionHistory.programHistoryUid,
            sessionUid: sessionHistory.sessionUid,
            progressedTimeInSeconds: newSession.progressedSessionTimeInSeconds,
            sessionMemo: newSession.sessionMemo,
          );
          await database.sessionHistoryDao
              .updateSessionHistoryDto(newSessionHistory.toCompanion());
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ProgramHistory>> readProgramHistories(String programUid) async {
    final programHistoryDtos = await database.programHistoryDao
        .readProgramHistoryDtosByProgramUid(programUid);
    return programHistoryDtos
        .map((programHistoryDto) =>
            ProgramHistoryDbMapper.fromDto(programHistoryDto))
        .toList();
  }

  @override
  Future<List<SessionHistory>> readSessionHistories(
      String programHistoryUid) async {
    final sessionHistoryDtos = await database.sessionHistoryDao
        .readSessionHistoryDtosByProgramHistoryUid(programHistoryUid);
    return sessionHistoryDtos
        .map((sessionHistoryDto) =>
            SessionHistoryDbMapper.fromDto(sessionHistoryDto))
        .toList();
  }

  @override
  Future<void> deleteProgram(Program program) async {
    // 프로그램 테이블 -> 해당 프로그램 삭제
    //   - 프로그램 히스토리 테이블 -> 해당 프로그램 uid인 프로그램 히스토리 삭제
    // 세션 테이블 -> 해당 프로그램 uid인 세션 삭제
    //   - 세션 히스토리 테이블 -> 해당 세션uid인 세션 히스토리 삭제

    await database.transaction(() async {
      await database.programDao.deleteProgramDto(program.programUid);
      await database.programHistoryDao
          .deleteProgramHistoryDto(program.programUid);
      await database.sessionDao.deleteSessionDto(program.programUid);
      await database.sessionHistoryDao
          .deleteSessionHistoryDto(program.programUid);
    });
  }
}

class TempDataSource {
  static final Map<String, Map> _localDB = {
    'program': <String, Program>{},
    'session': <String, Session>{},
    'program_history': <String, ProgramHistory>{},
    'session_history': <String, SessionHistory>{},
  };

  final database = AppDatabase();

  // getTable(String tableName) => switch (tableName) {
  //       'program' => database.programDtos,
  //       'session' => database.sessionDtos,
  //       'program_history' => database.programHistoryDtos,
  //       'session_history' => database.sessionHistoryDtos,
  //       _ => throw UnimplementedError(),
  //     };

  // toDto(dynamic data) => switch (data) {
  //       Program _ => data.toCompanion(),
  //       Session _ => data.toCompanion(),
  //       ProgramHistory _ => data.toCompanion(),
  //       SessionHistory _ => data.toCompanion(),
  //       _ => throw UnimplementedError(),
  //     };

  // 현재 dataUid를 PK로 사용하고 있음
  Future<String> create(
      {required String tableName,
      required dynamic data,
      String? dataUid}) async {
    final String uid = dataUid ?? const Uuid().v4();

    data.toDto();
    try {
      // await database
      //     .into(getTable(tableName))
      //     .insert(data.toDto()); // upsert로 할지..?
      talker.warning('datasource/create -> $tableName: $uid');
      return uid;
    } catch (e) {
      throw Exception(e);
    }
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
