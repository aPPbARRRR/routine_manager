import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routine_manager/presentation/provider/progressing_program_collection.dart';

import '../../model/program.dart';
import '../../service/app_service.dart';
import '../constant/window_size.dart';
part 'fetched_programs.g.dart';

@riverpod
class FetchedPrograms extends _$FetchedPrograms {
  @override
  FutureOr<List<Program>> build() async {
    return await getSavedPrograms();
  }

  late final AppService service = ref.read(appServiceProvider);

  Future<List<Program>> getSavedPrograms() async {
    final programs = await service.getSavedPrograms();
    await WindowSize.updateWindowSize(
      size: Size(
          WindowSize.currentSize.width,
          programs.isEmpty
              ? 90 + 75
              : programs.length > 3
                  ? 3 * 90 + 75
                  : programs.length * 90 + 75),
    );
    return programs;
  }

  Future<void> refresh() async {
    state = AsyncData(await getSavedPrograms());
  }

  void goProgram(Program program) {}

  void goCreateProgramScreen() {}

  Future<void> removeProgram(Program program, BuildContext context) async {
    // run중인 프로그램이면 삭제 불가 메세지
    if (ref
        .read(progressingProgramCollectionProvider.notifier)
        .isThisProgramRunning(program)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('실행중인 프로그램은 삭제할 수 없습니다.'),
        ),
      );
      return;
    }
    await service.removeProgram(program);
    await refresh();
  }
}
