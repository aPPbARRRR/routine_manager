import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(500, 350),
    center: true,
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
    skipTaskbar: false,
    alwaysOnTop: true,
  );
  await windowManager.setResizable(false);
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    // ## 준비할 때 검은화면 없이 준비하고, 준비완료시 show, Focus 순으로 실행하는 코드? 맥때문에 있는거?
    await windowManager.show();
    await windowManager.focus();
  });
  await windowManager.setOpacity(0.8);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final virtualWindowFrameBuilder = VirtualWindowFrameInit();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        child = virtualWindowFrameBuilder(context, child);
        return child;
      },
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
