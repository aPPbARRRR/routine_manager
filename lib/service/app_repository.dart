import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/program.dart';
import 'impl/app_repository_impl.dart';

final appRepositoryProvider = Provider<AppRepository>((ref) {
  return AppRepositoryImpl();
});

abstract interface class AppRepository {
  Future<void> saveProgram(Program program);
  Future<List<Program>> getAllPrograms();
}
