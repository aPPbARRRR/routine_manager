import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_manager/presentation/widget/app_dialog_with_two_buttons.dart';
import 'package:window_manager/window_manager.dart';

import '../widget/app_scaffold.dart';

class DefaultLayout extends ConsumerStatefulWidget {
  const DefaultLayout({
    super.key,
    required this.titleBarActions,
    required this.body,
    this.drawer,
    this.endDrawer,
    this.scaffoldKey,
  });

  final List<Widget> titleBarActions;
  final Widget body;
  final Widget? drawer;
  final Widget? endDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  ConsumerState<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends ConsumerState<DefaultLayout>
    with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _init();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    // Add this line to override the default close handler
    await windowManager.setPreventClose(true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldKey: widget.scaffoldKey,
      isSafeToTitleBar: true,
      backgroundColor: Color.fromARGB(255, 36, 72, 126),
      titleBarActions: [
        ...widget.titleBarActions,
        // 화면 고정 아이콘
      ],
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      body: widget.body, // 일일 주기 프로그램 있을 시 goProgram 후 briefScreen으로.
    );
  }

  // @override
  // void onWindowEvent(String eventName) {
  //   print('[WindowManager] onWindowEvent: $eventName');
  // }

  @override
  void onWindowClose() async {
    {
      bool _isPreventClose = await windowManager.isPreventClose();
      if (_isPreventClose) {
        showDialog(
          context: context,
          builder: (_) => AppDialogWithTwoButtons(
            content: '앱을 종료하시겠습니까?',
            cancelText: '취소',
            confirmText: '종료',
            onConfirm: () async {
              await windowManager.destroy();
            },
          ),
        );
      }
    }
  }

  // @override
  // void onWindowFocus() {
  //   // do something
  // }

  // @override
  // void onWindowBlur() {
  //   // do something
  // }

  // @override
  // void onWindowMaximize() {
  //   // do something
  // }

  // @override
  // void onWindowUnmaximize() {
  //   // do something
  // }

  // @override
  // void onWindowMinimize() {
  //   // do something
  // }

  // @override
  // void onWindowRestore() {
  //   // do something
  // }

  // @override
  // void onWindowResize() {
  //   // do something
  // }

  // @override
  // void onWindowMove() {
  //   // do something
  // }

  // @override
  // void onWindowEnterFullScreen() {
  //   // do something
  // }

  // @override
  // void onWindowLeaveFullScreen() {
  //   // do something
  // }
}
