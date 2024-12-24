import 'package:flutter/material.dart';
import 'package:routine_manager/presentation/constant/window_size.dart';

import '../constant/app_color.dart';
import 'app_text_button.dart';

class AppDialogWithTwoButtons extends StatelessWidget {
  const AppDialogWithTwoButtons({
    super.key,
    this.title,
    required this.content,
    this.height = 150,
    this.onConfirm,
    this.onCancel,
    this.cancelText,
    this.confirmText,
  });

  final double height;
  final String? title;
  final String content;
  final Function()? onConfirm;
  final Function()? onCancel;
  final String? cancelText;
  final String? confirmText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColor.primaryMain,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null)
              Text(title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(content),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTextButton(
                  onPressed: () async {
                    await onCancel?.call();
                    Navigator.pop(context);
                  },
                  text: cancelText ?? '취소',
                ),
                AppTextButton(
                  onPressed: () async {
                    await onConfirm?.call();
                    Navigator.pop(context);
                  },
                  text: confirmText ?? '확인',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
