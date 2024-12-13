import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/program.dart';
import '../../service/app_service.dart';
part 'fetched_programs.g.dart';

@riverpod
class FetchedPrograms extends _$FetchedPrograms {
  @override
  FutureOr<List<Program>> build() async {
    return await getSavedPrograms();
  }

  late final AppService service = ref.read(appServiceProvider);

  Future<List<Program>> getSavedPrograms() async {
    return await service.getSavedPrograms();
  }

  Future<void> refresh() async {
    state = AsyncData(await getSavedPrograms());
  }

  void goProgram(Program program) {}

  void goCreateProgramScreen() {}

  Future<void> removeProgram() async {
    // 완료시 화면 최신화
  }
}
