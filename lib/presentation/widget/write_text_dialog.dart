import 'package:flutter/material.dart';
import 'package:routine_manager/presentation/widget/app_textfield.dart';

import '../constant/app_color.dart';
import 'app_text_button.dart';

class WriteTextDialog extends StatefulWidget {
  const WriteTextDialog({
    super.key,
    required this.fontSize,
    required this.textFieldHeight,
    this.hintText,
    this.onSave,
    this.initialText,
    this.isReadOnly = false,
  });

  final double fontSize;
  final int textFieldHeight;
  final String? hintText;
  final Function(String)? onSave;
  final String? initialText;
  final bool isReadOnly;
  @override
  State<WriteTextDialog> createState() => _WriteTextDialogState();
}

class _WriteTextDialogState extends State<WriteTextDialog> {
  late final TextEditingController controller = TextEditingController(
    text: widget.initialText == null || widget.initialText == ''
        ? null
        : widget.initialText,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryMain,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              isReadOnly: widget.isReadOnly,
              isFontSizeAuto: false,
              fontSize: widget.fontSize,
              height: widget.textFieldHeight,
              maxLines: widget.textFieldHeight ~/ widget.fontSize,
              controller: controller,
              hintText: widget.hintText,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.isReadOnly)
                  AppTextButton(
                    onPressed: () => Navigator.pop(context),
                    text: '돌아가기',
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                if (!widget.isReadOnly)
                  AppTextButton(
                    onPressed: () => Navigator.pop(context),
                    text: '취소',
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                if (!widget.isReadOnly)
                  AppTextButton(
                    onPressed: () async {
                      if (widget.onSave != null) {
                        await widget.onSave!(controller.text);
                      }
                      Navigator.pop(context);
                    },
                    text: '저장',
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
