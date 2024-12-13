import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:routine_manager/presentation/screen/program_collection_screen.dart';
import 'package:window_manager/window_manager.dart';

import '../screen/brief_board_screen.dart';
import '../screen/create_program_screen.dart';
import '../widget/app_scaffold.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({
    super.key,
    required this.titleBarActions,
    required this.body,
  });

  final List<Widget> titleBarActions;
  final Widget body;

  @override
  _DefaultLayoutState createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> with WindowListener {
  bool isAlwaysOnTop = true;

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
      isSafeToTitleBar: true,
      backgroundColor: Color.fromARGB(255, 36, 72, 126),
      titleBarActions: [
        ...widget.titleBarActions,
        // 화면 고정 아이콘
        IconButton(
          onPressed: () async {
            await windowManager.isAlwaysOnTop()
                ? windowManager.setAlwaysOnTop(false)
                : windowManager.setAlwaysOnTop(true);
            setState(() {
              isAlwaysOnTop = !isAlwaysOnTop;
            });
          },
          icon: Icon(
            isAlwaysOnTop ? Symbols.keep : Symbols.keep_off,
            color: isAlwaysOnTop ? Colors.white : Colors.grey,
            size: 18,
          ),
        ),
      ],
      body: widget.body, // 일일 주기 프로그램 있을 시 goProgram 후 briefScreen으로.
    );
  }

  @override
  void onWindowEvent(String eventName) {
    print('[WindowManager] onWindowEvent: $eventName');
  }

  @override
  void onWindowClose() async {
    {
      bool _isPreventClose = await windowManager.isPreventClose();
      if (_isPreventClose) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Are you sure you want to close this window?'),
              actions: [
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await windowManager.destroy();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void onWindowFocus() {
    // do something
  }

  @override
  void onWindowBlur() {
    // do something
  }

  @override
  void onWindowMaximize() {
    // do something
  }

  @override
  void onWindowUnmaximize() {
    // do something
  }

  @override
  void onWindowMinimize() {
    // do something
  }

  @override
  void onWindowRestore() {
    // do something
  }

  @override
  void onWindowResize() {
    // do something
  }

  @override
  void onWindowMove() {
    // do something
  }

  @override
  void onWindowEnterFullScreen() {
    // do something
  }

  @override
  void onWindowLeaveFullScreen() {
    // do something
  }
}
