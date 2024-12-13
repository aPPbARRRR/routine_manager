import 'package:flutter/material.dart';

class AppTextButtonWithIcon extends StatelessWidget {
  const AppTextButtonWithIcon(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label});

  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
