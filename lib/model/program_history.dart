import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_history.freezed.dart';
part 'program_history.g.dart';

@freezed
class ProgramHistory with _$ProgramHistory {
  const factory ProgramHistory({
    required String historyUid,
    required String programUid,
    required DateTime startedAt,
    required DateTime? endedAt,
    required int totalProgressedTimeInSeconds,
  }) = _ProgramHistory;

  factory ProgramHistory.fromJson(Map<String, dynamic> json) =>
      _$ProgramHistoryFromJson(json);
}
