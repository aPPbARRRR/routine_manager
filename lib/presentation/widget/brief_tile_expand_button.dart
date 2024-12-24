import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../constant/app_color.dart';

class BriefTileExpandButton extends StatefulWidget {
  const BriefTileExpandButton({
    super.key,
    required this.onPressed,
    required this.isExpanded,
  });

  final VoidCallback onPressed;
  final bool isExpanded;
  @override
  State<BriefTileExpandButton> createState() => _BriefTileExpandButtonState();
}

class _BriefTileExpandButtonState extends State<BriefTileExpandButton> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: IconButton(
        padding: EdgeInsets.zero,
        tooltip: widget.isExpanded ? '접기' : '펼치기',
        onPressed: widget.onPressed,
        icon: Container(
          decoration: BoxDecoration(
            color: _isHovering ? AppColor.white.withOpacity(0.7) : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Icon(
              widget.isExpanded
                  ? Symbols.arrow_drop_up
                  : Symbols.arrow_drop_down,
              size: 18,
              color: _isHovering ? AppColor.primaryMain : AppColor.gray0,
            ),
          ),
        ),
      ),
    );
  }
}
