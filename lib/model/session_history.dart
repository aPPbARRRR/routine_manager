import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:routine_manager/data/datasource/database/app_database.dart';

part 'session_history.freezed.dart';
part 'session_history.g.dart';

@freezed
class SessionHistory with _$SessionHistory {
  const factory SessionHistory({
    required String sessionHistoryUid,
    required String programHistoryUid,
    required String sessionUid,
    required int progressedTimeInSeconds,
    @Default('') String? sessionMemo,
  }) = _SessionHistory;

  factory SessionHistory.fromJson(Map<String, dynamic> json) =>
      _$SessionHistoryFromJson(json);
}
