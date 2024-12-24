import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../main.dart';
import '../../model/program_history.dart';
import '../../service/app_service.dart';
part 'fetched_program_history_collection.g.dart';

@riverpod
class FetchedProgramHistoryCollection
    extends _$FetchedProgramHistoryCollection {
  @override
  FutureOr<List<ProgramHistory>> build({required String programUid}) async {
    talker.error('FetchedProgramHistoryCollection -> build ->$programUid');
    return await readProgramHistoryCollection(programUid);
  }

  late final AppService _appService = ref.read(appServiceProvider);

  Future<void> fetchProgramHistoryCollection(String programUid) async =>
      state = AsyncData(await readProgramHistoryCollection(programUid));

  Future<List<ProgramHistory>> readProgramHistoryCollection(
      String programUid) async {
    try {
      final result = await _appService.getProgramHistoryCollection(programUid);
      return result;
    } catch (e) {
      return [];
    }
  }
}
