import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../table/session_history_dtos.dart';

part 'session__history_dao.g.dart';

@DriftAccessor(tables: [SessionHistoryDtos])
class SessionHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$SessionHistoryDaoMixin {
  SessionHistoryDao(AppDatabase db) : super(db);

  Future<List<SessionHistoryDto>> get readAllSessionHistoryDtos =>
      select(db.sessionHistoryDtos).get();

  Future<List<SessionHistoryDto>> readSessionHistoryDtosByProgramHistoryUid(
      String programHistoryUid) {
    return (select(db.sessionHistoryDtos)
          ..where((t) => t.programHistoryUid.equals(programHistoryUid)))
        .get();
  }

  Future<int> createSessionHistoryDto(
      SessionHistoryDtosCompanion sessionHistoryDto) {
    return into(db.sessionHistoryDtos).insert(sessionHistoryDto);
  }

  Future<int> updateSessionHistoryDto(
      SessionHistoryDtosCompanion sessionHistoryDto) {
    return (update(db.sessionHistoryDtos)
          ..where((t) => t.sessionHistoryUid
              .equals(sessionHistoryDto.sessionHistoryUid.value)))
        .write(sessionHistoryDto);
  }

  Future<int> deleteSessionHistoryDto(String sessionUid) {
    return (delete(db.sessionHistoryDtos)
          ..where((t) => t.sessionUid.equals(sessionUid)))
        .go();
  }
}
