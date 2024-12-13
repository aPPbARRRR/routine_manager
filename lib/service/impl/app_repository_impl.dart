import 'package:routine_manager/model/session.dart';
import 'package:uuid/uuid.dart';

import '../../model/program.dart';
import '../app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final db = TempDataSource();
  @override
  Future<void> saveProgram(Program program) async {
    await db.create(tableName: 'program', data: program);
  }

  @override
  Future<List<Program>> getAllPrograms() async {
    return (await db.readAll(tableName: 'program'))
        .map((e) => e as Program) // ## 오류 수정 불요. db 붙이며 수정할 것.
        .toList();
  }
}

class TempDataSource {
  Future<String> create(
      {required String tableName,
      required dynamic data,
      String? dataUid}) async {
    if (!_localDB.containsKey(tableName)) {
      throw Exception('Table $tableName does not exist');
    }
    final String uid = dataUid ?? const Uuid().v4();
    _localDB[tableName]![uid] = data;
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
    // talker.warning('datasource/read -> dataUid: $dataUid');
    // talker.warning('datasource/read -> ${_localDB[tableName]}');
    return _localDB[tableName]![dataUid];
  }

  Future<List<dynamic>> readAll({
    required String tableName,
  }) async {
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
  }

  static final Map<String, Map> _localDB = {
    'program': <String, Program>{},
    'session': <String, Session>{},
  };
}
