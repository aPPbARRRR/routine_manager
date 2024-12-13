import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/program.dart';
import 'app_repository.dart';
import 'impl/app_service_impl.dart';

final appServiceProvider = Provider<AppService>((ref) {
  return AppServiceImpl(
    repository: ref.read(appRepositoryProvider),
  );
});

abstract interface class AppService {
  Future<List<Program>> getSavedPrograms();
  Future<void> saveProgram(Program program);
}
