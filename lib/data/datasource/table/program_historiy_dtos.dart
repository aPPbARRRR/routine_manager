import 'package:drift/drift.dart';

class ProgramHistoryDtos extends Table {
  // required String historyUid,
  //   required String programUid,
  //   required DateTime startedAt,
  //   required DateTime? endedAt,
  //   required int totalProgressedTimeInSeconds,

  TextColumn get programHistoryUid => text()();
  TextColumn get programUid => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  IntColumn get totalProgressedTimeInSeconds => integer()();
}
