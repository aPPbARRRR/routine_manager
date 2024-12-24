import 'dart:io';

import 'package:flutter/material.dart';

import '../constant/window_size.dart';
import 'always_on_icon_button.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.isSafeToTitleBar = false,
    this.titleBarActions,
    this.scaffoldKey,
    required this.body,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.appBar,
    this.leading,
    this.isSideScreen = false,
  });

  final bool isSafeToTitleBar;
  final List<Widget>? titleBarActions;
  final Key? scaffoldKey;
  final Widget body;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;
  final Widget? leading;
  final bool isSideScreen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: WindowSize.titleBarHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: switch (Platform.operatingSystem) {
                  'windows' => MainAxisAlignment.start,
                  'macos' => MainAxisAlignment.end,
                  _ => MainAxisAlignment.center,
                },
                children: [
                  if (titleBarActions != null && titleBarActions!.isNotEmpty)
                    ...titleBarActions!,
                  if (!isSideScreen) const AlwaysOnIconButton(),
                  if (!isSideScreen)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: StreamBuilder(
                        stream: Stream.periodic(const Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          final now = DateTime.now();
                          final period = now.hour < 12 ? '오전' : '오후';
                          final hour =
                              now.hour <= 12 ? now.hour : now.hour - 12;
                          return Text(
                            '$period ${hour.toString().padLeft(2, '0')}'
                            ':${now.minute.toString().padLeft(2, '0')}'
                            // ':${now.second.toString().padLeft(2, '0')}'
                            ,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            Expanded(child: body),
          ],
        ),
        backgroundColor: backgroundColor,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
        endDrawer: endDrawer,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
