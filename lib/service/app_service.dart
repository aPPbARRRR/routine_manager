import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/program.dart';
import '../model/program_history.dart';
import '../model/session_history.dart';
import '../data/repository/app_repository.dart';
import 'app_service_impl.dart';

final appServiceProvider = Provider<AppService>((ref) {
  return AppServiceImpl(
    repository: ref.read(appRepositoryProvider),
  );
});

abstract interface class AppService {
  Future<List<Program>> getSavedPrograms();
  Future<void> saveProgram(Program program);
  Future<void> saveHistory({required Program program});
  Future<List<ProgramHistory>> getProgramHistoryCollection(String programUid);
  Future<List<SessionHistory>> getSessionHistoryCollection(
      String programHistoryUid);
  Future<void> removeProgram(Program program);
}
