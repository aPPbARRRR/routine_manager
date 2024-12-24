import 'package:routine_manager/model/session.dart';

extension SessionExtension on Session {
  Session progressSession() {
    return this.copyWith(
      progressedSessionTimeInSeconds: progressedSessionTimeInSeconds + 1,
    );
  }

  bool get isSessionCompleted =>
      sessionTimeInSeconds <= progressedSessionTimeInSeconds;

  int get sessionRemainingTime =>
      sessionTimeInSeconds - progressedSessionTimeInSeconds;
}
