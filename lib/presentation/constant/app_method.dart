class AppMethod {
  // ~시간~분~초
  static String remainingTimeTextWithUnit(
      {required int timeInSeconds,
      required int progressedTimeInSeconds,
      String? leading,
      String? trailing}) {
    return '${leading ?? ''} ${((timeInSeconds - progressedTimeInSeconds) ~/ 3600) > 0 ? '${(timeInSeconds - progressedTimeInSeconds) ~/ 3600} 시간 ' : ''}'
        '${((timeInSeconds - progressedTimeInSeconds) % 3600) ~/ 60 > 0 ? '${((timeInSeconds - progressedTimeInSeconds) % 3600) ~/ 60}분' : ''}'
        '${(timeInSeconds - progressedTimeInSeconds) < 600 ? '${((timeInSeconds - progressedTimeInSeconds) % 60) % 60} 초' : ''} ${trailing ?? ''}';
  }

  // ~시간 ~분 or ~분 ~초
  static String timeTextWithUnitTwoUnit(
      {required int timeInSeconds, String? leading, String? trailing}) {
    return '${leading ?? ''} ${timeInSeconds ~/ 3600 > 0 ? '${timeInSeconds ~/ 3600} 시간 ' : ''}'
        '${(timeInSeconds % 3600) ~/ 60 > 0 ? '${(timeInSeconds % 3600) ~/ 60}분 ' : ''}'
        '${timeInSeconds < 600 ? '${(timeInSeconds % 60) % 60} 초' : ''} ${trailing ?? ''}';
  }

  // ~시간 ~분 ~초
  static String timeTextWithUnitThreeUnit(
      {required int timeInSeconds, String? leading, String? trailing}) {
    return '${leading ?? ''} ${timeInSeconds ~/ 3600 > 0 ? '${timeInSeconds ~/ 3600} 시간 ' : ''}'
        '${(timeInSeconds % 3600) ~/ 60 > 0 ? '${(timeInSeconds % 3600) ~/ 60} 분 ' : ''}'
        '${'${(timeInSeconds % 60) % 60} 초'} ${trailing ?? ''}';
  }

  // 00:00
  static String timeTextWithColon(
      {required int timeInSeconds, String? leading, String? trailing}) {
    return '${leading ?? ''} ${(timeInSeconds ~/ 3600).toString().padLeft(2, '0')}:${((timeInSeconds % 3600) ~/ 60).toString().padLeft(2, '0')} ${trailing ?? ''}';
  }
}
