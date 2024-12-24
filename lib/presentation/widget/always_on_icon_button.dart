import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../constant/app_color.dart';
import '../provider/provided_app_settings.dart';

class AlwaysOnIconButton extends ConsumerStatefulWidget {
  const AlwaysOnIconButton({super.key});

  @override
  ConsumerState<AlwaysOnIconButton> createState() => _AlwaysOnIconButtonState();
}

class _AlwaysOnIconButtonState extends ConsumerState<AlwaysOnIconButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final appSettings = ref.watch(providedAppSettingsProvider);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        onPressed: () {
          ref.read(providedAppSettingsProvider.notifier).toggleAlwaysOnTop();
        },
        tooltip: appSettings.isAlwaysOnTop ? '고정 해제됨' : '고정됨',
        icon: Container(
          decoration: BoxDecoration(
            color: _isHovering ? AppColor.white.withOpacity(0.7) : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Icon(
              appSettings.isAlwaysOnTop ? Symbols.keep : Symbols.keep_off,
              size: 16,
              color: _isHovering ? AppColor.primaryMain : AppColor.gray0,
            ),
          ),
        ),
      ),
    );
  }
}
