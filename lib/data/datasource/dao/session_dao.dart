import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../table/session_dtos.dart';

part 'session_dao.g.dart';

@DriftAccessor(tables: [SessionDtos])
class SessionDao extends DatabaseAccessor<AppDatabase> with _$SessionDaoMixin {
  SessionDao(AppDatabase db) : super(db);

  Future<List<SessionDto>> get readAllSessionDtos =>
      select(db.sessionDtos).get();

  Future<SessionDto> readSessionDtoBySessionUid(String sessionUid) {
    return (select(db.sessionDtos)
          ..where((t) => t.sessionUid.equals(sessionUid)))
        .getSingle();
  }

  Future<int> createSessionDto(SessionDtosCompanion sessionDto) {
    return into(db.sessionDtos).insert(sessionDto);
  }

  Future<int> deleteSessionDto(String programUid) {
    return (delete(db.sessionDtos)
          ..where((t) => t.programUid.equals(programUid)))
        .go();
  }
}
