import 'package:drift/drift.dart';

class SessionDtos extends Table {
// required String sessionTitle,
//     required String sessionUid,
//     required int progressedSessionTimeInSeconds,
//     required int sessionTimeInSeconds,
//     required int sessionPriority,
//     required String sessionMemo,

  TextColumn get sessionUid => text()();
  TextColumn get sessionTitle => text()();
  IntColumn get progressedSessionTimeInSeconds => integer()();
  IntColumn get sessionTimeInSeconds => integer()();
  IntColumn get sessionPriority => integer()();
  TextColumn get sessionMemo => text()();
  TextColumn get programUid => text()();
}
