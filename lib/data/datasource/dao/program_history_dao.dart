import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../table/program_historiy_dtos.dart';

part 'program_history_dao.g.dart';

@DriftAccessor(tables: [ProgramHistoryDtos])
class ProgramHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$ProgramHistoryDaoMixin {
  ProgramHistoryDao(AppDatabase db) : super(db);

  // program uid 로 해당 program의 모든 history 조회
  Future<List<ProgramHistoryDto>> readProgramHistoryDtosByProgramUid(
      String programUid) {
    return (select(db.programHistoryDtos)
          ..where((t) => t.programUid.equals(programUid)))
        .get();
  }

  // program history uid 로 단일 program history 조회
  Future<ProgramHistoryDto> readProgramHistoryDtoByProgramHistoryUid(
      String programHistoryUid) {
    return (select(db.programHistoryDtos)
          ..where((t) => t.programHistoryUid.equals(programHistoryUid)))
        .getSingle();
  }

  Future<int> createProgramHistoryDto(
      ProgramHistoryDtosCompanion programHistoryDto) {
    return into(db.programHistoryDtos).insert(programHistoryDto);
  }

  Future<int> updateProgramHistoryDto(
      ProgramHistoryDtosCompanion programHistoryDto) {
    return (update(db.programHistoryDtos)
          ..where((t) => t.programHistoryUid
              .equals(programHistoryDto.programHistoryUid.value)))
        .write(programHistoryDto);
  }

  Future<int> deleteProgramHistoryDto(String programUid) {
    return (delete(db.programHistoryDtos)
          ..where((t) => t.programUid.equals(programUid)))
        .go();
  }
}
