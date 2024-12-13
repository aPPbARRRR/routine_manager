import '../../model/program.dart';
import '../app_repository.dart';
import '../app_service.dart';

class AppServiceImpl implements AppService {
  AppServiceImpl({required this.repository});

  final AppRepository repository;

  @override
  Future<List<Program>> getSavedPrograms() {
    return repository.getAllPrograms();
  }

  @override
  Future<void> saveProgram(Program program) async {
    await repository.saveProgram(program);
  }
}
