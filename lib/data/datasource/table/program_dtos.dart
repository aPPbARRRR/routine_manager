import 'package:drift/drift.dart';

class ProgramDtos extends Table {
  //  required String programTitle,
  // required String programUid,
  // required String programDescription,
  // // 프로그램 시작시 입력
  // @Default(null) DateTime? startedAt,
  // required int programTimeInSeconds,
  // required int progressedProgramTimeInSeconds,
  // required List<Session> programSessions,
  // @Default(null) String? programHistoryUid,

  TextColumn get programTitle => text()();
  TextColumn get programUid => text()();
  TextColumn get programDescription => text()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  IntColumn get programTimeInSeconds => integer()();
  IntColumn get progressedProgramTimeInSeconds => integer()();
  TextColumn get programHistoryUid => text().nullable()();
}
