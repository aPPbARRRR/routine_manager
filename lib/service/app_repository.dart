import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routine_manager/model/program_history.dart';

import '../model/program.dart';
import '../model/session_history.dart';
import 'impl/app_repository_impl.dart';

final appRepositoryProvider = Provider<AppRepository>((ref) {
  return AppRepositoryImpl();
});

abstract interface class AppRepository {
  Future<void> saveProgram(Program program);
  Future<List<Program>> getAllPrograms();
  Future<void> createHistory(Program program);
  Future<void> updateHistory({required Program program, DateTime? endedAt});
  Future<ProgramHistory?> readProgramHistory(String programHistoryUid);
  Future<List<ProgramHistory>> readProgramHistories(String programUid);
  Future<List<SessionHistory>> readSessionHistories(String programHistoryUid);
  Future<void> deleteProgram(Program program);
}
