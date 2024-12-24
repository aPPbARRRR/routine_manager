import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.padding,
    this.isEnabled = true,
  });

  final VoidCallback onPressed;
  final String text;
  final EdgeInsets? padding;
  final bool isEnabled;
  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  bool _isMouseOveringOnButton = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: MouseRegion(
        onEnter: (event) => widget.isEnabled
            ? setState(() {
                _isMouseOveringOnButton = true;
              })
            : null,
        onExit: (event) => widget.isEnabled
            ? setState(() {
                _isMouseOveringOnButton = false;
              })
            : null,
        child: Container(
          decoration: BoxDecoration(
            color: _isMouseOveringOnButton
                ? AppColor.gray0.withOpacity(0.1)
                : null,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: widget.isEnabled ? widget.onPressed : null,
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.isEnabled ? Colors.white : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
