import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required String sessionTitle,
    required String sessionUid,
    required int progressedSessionTimeInSeconds,
    required int sessionTimeInSeconds,
    required int sessionPriority,
    required String sessionMemo,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
