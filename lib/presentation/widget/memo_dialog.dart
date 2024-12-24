import 'package:flutter/material.dart';

class MemoDialog extends StatelessWidget {
  const MemoDialog({super.key, required this.memo});

  final String memo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Text(memo),
        ],
      ),
    );
  }
}
