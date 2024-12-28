import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../dao/program_dao.dart';
import '../dao/program_history_dao.dart';
import '../dao/session__history_dao.dart';
import '../dao/session_dao.dart';
import '../table/program_dtos.dart';
import '../table/session_dtos.dart';
import '../table/program_historiy_dtos.dart';
import '../table/session_history_dtos.dart';

part 'app_database.g.dart';

// transaction

@DriftDatabase(
  tables: [ProgramDtos, SessionDtos, ProgramHistoryDtos, SessionHistoryDtos],
  daos: [ProgramDao, SessionDao, ProgramHistoryDao, SessionHistoryDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }
}
