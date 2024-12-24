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
    // 프로그램 시작시 입력
    @Default(null) DateTime? startedAt,
    required int programTimeInSeconds,
    required int progressedProgramTimeInSeconds,
    required List<Session> programSessions,
    @Default(null) String? programHistoryUid,
  }) = _Program;

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);
}
