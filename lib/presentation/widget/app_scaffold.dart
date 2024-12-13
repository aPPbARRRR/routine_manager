import 'dart:io';

import 'package:flutter/material.dart';

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
              height: 30,
              child: Row(
                mainAxisAlignment: switch (Platform.operatingSystem) {
                  'windows' => MainAxisAlignment.start,
                  'macos' => MainAxisAlignment.end,
                  _ => MainAxisAlignment.center,
                },
                children: titleBarActions ?? [],
              ),
            ),
            body,
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