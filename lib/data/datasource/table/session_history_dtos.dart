import 'package:drift/drift.dart';

class SessionHistoryDtos extends Table {
  // required String sessionHistoryUid,
  //   required String programHistoryUid,
  //   required String sessionUid,
  //   required int progressedTimeInSeconds,
  //   @Default('') String? sessionMemo,

  TextColumn get sessionHistoryUid => text()();
  TextColumn get programHistoryUid => text()();
  TextColumn get sessionUid => text()();
  IntColumn get progressedTimeInSeconds => integer()();
  TextColumn get sessionMemo => text().nullable()();
}
