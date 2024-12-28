import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../table/program_dtos.dart';

part 'program_dao.g.dart';

@DriftAccessor(tables: [ProgramDtos])
class ProgramDao extends DatabaseAccessor<AppDatabase> with _$ProgramDaoMixin {
  ProgramDao(AppDatabase db) : super(db);

  Future<List<ProgramDto>> get readAllProgramDtos =>
      select(db.programDtos).get();

  Future<ProgramDto> readProgramDtoByProgramUid(String programUid) {
    return (select(db.programDtos)
          ..where((t) => t.programUid.equals(programUid)))
        .getSingle();
  }

  Future<int> createProgramDto(ProgramDtosCompanion programDto) {
    return into(db.programDtos).insert(programDto);
  }

  Future<int> deleteProgramDto(String programUid) {
    return (delete(db.programDtos)
          ..where((t) => t.programUid.equals(programUid)))
        .go();
  }
}
