import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:routine_manager/model/session.dart';

part 'program.freezed.dart';
part 'program.g.dart';

@freezed
class Program with _$Program {
  const factory Program({
    required String programTitle,
    required String programUid,
    required String programDescription,
    required int startedHour,
    required int startedMinute,
    required int programTimeInSeconds,
    required List<Session> programSessions,
  }) = _Program;

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);
}
