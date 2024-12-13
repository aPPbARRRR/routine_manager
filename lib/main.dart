import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routine_manager/presentation/constant/window_size.dart';
import 'package:routine_manager/presentation/layout/default_layout.dart';
import 'package:window_manager/window_manager.dart';

import 'presentation/screen/program_collection_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: WindowSize.defaultSize, // 세로 길이 타이틀바(30) 제외 각 위젯당 100씩 할당
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
  await windowManager.setOpacity(0.9);
  // await windowManager.setMaximumSize(Size(430, 120));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final virtualWindowFrameBuilder = VirtualWindowFrameInit();

    return ProviderScope(
        child: MaterialApp(
      theme: ThemeData(
          // 기본 텍스트 화이트
          textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      )),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        child = virtualWindowFrameBuilder(context, child);
        return child;
      },
      home: const ProgramCollectionScreen(),
    ));
  }
}
