import 'package:flutter/material.dart';

import '../constant/app_color.dart';

// #
// 아이콘버튼 기본 패딩으로 인해 height 50, width 50 이상의 상위위젯 크기 사용 권장

class AppIconButton extends StatefulWidget {
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.tooltip,
    this.padding,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String tooltip;
  final EdgeInsets? padding;

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        onPressed: () => widget.onPressed(),
        tooltip: widget.tooltip,
        style: IconButton.styleFrom(
          padding: widget.padding,
          hoverColor: Colors.transparent,
        ),
        icon: Container(
          decoration: BoxDecoration(
            color: _isHovering ? AppColor.white.withOpacity(0.7) : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Icon(
              widget.icon,
              size: 18,
              color: _isHovering ? AppColor.primaryMain : AppColor.gray0,
            ),
          ),
        ),
      ),
    );
  }
}
