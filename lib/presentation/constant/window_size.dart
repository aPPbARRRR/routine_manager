import 'dart:ui';

import 'package:routine_manager/main.dart';
import 'package:window_manager/window_manager.dart';

class WindowSize {
  static const double titleBarHeight = 34;
  static const Size defaultSize = Size(439, 300);

  static Size currentSize = defaultSize;

  static const double sideScreenWidth = 200;

  static Future<void> openSideScreen() async =>
      await horizontalExpand(addingWidth: sideScreenWidth);

  static Future<void> closeSideScreen() async =>
      await horizontalExpand(addingWidth: -sideScreenWidth);

  static Future<void> updateWindowSize(
      {Size? size, VoidCallback? onExpanded}) async {
    final sizeToChange = size ?? defaultSize;
    // 입력받는 사이즈가 널이 아니고, 사이즈 가로 세로 중 하나라도 기존 사이즈보다 작아지면 onExpanded 먼저 수행
    if (sizeToChange.width < currentSize.width ||
        sizeToChange.height < currentSize.height) {
      talker.error('windowSize change ##before setstate'); // ####
      currentSize = sizeToChange;
      onExpanded?.call();
      // await Future.delayed(Duration(milliseconds: 1000)); //####
      await windowManager.setSize(currentSize);
    } else {
      talker.error('windowSize change ##after setstate'); // ####
      currentSize = sizeToChange;
      await windowManager.setSize(currentSize);
      // await Future.delayed(Duration(milliseconds: 1000)); //####
      onExpanded?.call();
    }
  }

  static Future<void> verticalExpand(
          {required double addingHeight, VoidCallback? onExpanded}) async =>
      await updateWindowSize(
          size: Size(currentSize.width, currentSize.height + addingHeight),
          onExpanded: onExpanded);

  static Future<void> horizontalExpand(
          {required double addingWidth, VoidCallback? onExpanded}) async =>
      await updateWindowSize(
          size: Size(currentSize.width + addingWidth, currentSize.height),
          onExpanded: onExpanded);

  // static Future<void> verticalExpand(
  //     {required double addingHeight, VoidCallback? onExpanded}) async {
  //   // 축소시 onexpand로 받는 setstate를 창 크기 변경 이전 수행
  //   if (addingHeight < 0) {
  //     onExpanded?.call();
  //   }

  //   await updateWindowSize(
  //     size: Size(currentSize.width, currentSize.height + addingHeight),
  //   );
  //   // 확장시 onexpand로 받는 setstate를 창 크기 변경 이후 수행
  //   if (addingHeight > 0) {
  //     onExpanded?.call();
  //   }
  // }

  // static Future<void> horizontalExpand(
  //     {required double addingWidth, VoidCallback? onExpanded}) async {
  //   // 축소시 onexpand로 받는 setstate를 창 크기 변경 이전 수행
  //   if (addingWidth < 0) {
  //     onExpanded?.call();
  //   }
  //   await updateWindowSize(
  //     size: Size(currentSize.width + addingWidth, currentSize.height),
  //   );
  //   // 확장시 onexpand로 받는 setstate를 창 크기 변경 이후 수행
  //   if (addingWidth > 0) {
  //     onExpanded?.call();
  //   }
  // }

  // 가로, 세로 동시 변경
  static Future<void> expand(
      {required double addingWidth,
      required double addingHeight,
      VoidCallback? onExpanded}) async {
    // 가로 세로 하나라도 축소되는 경우 먼저 onExpaned 수행
    if (addingWidth < 0 || addingHeight < 0) {
      onExpanded?.call();
    }
    await updateWindowSize(
      size: Size(
          currentSize.width + addingWidth, currentSize.height + addingHeight),
    );
    // 가로 세로 모두 축소되지 않는 경우 함수 종료 전 onExpanded 수행
    if (addingWidth >= 0 && addingHeight >= 0) {
      onExpanded?.call();
    }
  }
}
