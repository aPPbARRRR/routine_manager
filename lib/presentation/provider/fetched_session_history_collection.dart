import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/session_history.dart';
import '../../service/app_service.dart';
part 'fetched_session_history_collection.g.dart';

@riverpod
class FetchedSessionHistoryCollection
    extends _$FetchedSessionHistoryCollection {
  @override
  FutureOr<List<SessionHistory>> build(String programHistoryUid) async {
    return await readSessionHistoryCollection(programHistoryUid);
  }

  late final AppService _appService = ref.read(appServiceProvider);

  Future<List<SessionHistory>> readSessionHistoryCollection(
          String programHistoryUid) async =>
      await _appService.getSessionHistoryCollection(programHistoryUid);

  Future<void> fetchSessionHistoryCollection(String programHistoryUid) async =>
      state = AsyncData(await readSessionHistoryCollection(programHistoryUid));
}
