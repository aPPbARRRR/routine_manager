import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.height,
    this.width,
    required this.maxLines,
    required this.controller,
    this.hintText,
    this.filledColor = const Color.fromARGB(255, 31, 59, 102),
    this.hintTextColor = Colors.grey,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.maxLength,
    this.isFontSizeAuto = true,
    this.fontSize,
    this.hintFontSize,
    this.padding,
  });

  final int height;
  final int? width;
  final int maxLines;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Color? filledColor;
  final Color hintTextColor;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? errorText;
  final int? maxLength;
  final bool isFontSizeAuto;
  final double? fontSize;
  final double? hintFontSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: filledColor ?? Color.fromARGB(255, 31, 59, 102),
      ),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    );

    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        height: height.toDouble(),
        width: width?.toDouble() ?? constraint.maxWidth,
        child: TextField(
          onChanged: onChanged,

          style: const TextStyle(
            color: Colors.white,
          ),
          maxLines: maxLines,
          maxLength: maxLength,

          cursorWidth: 2,
          // cursorColor: Color.fromARGB(255, 7, 36, 57),
          cursorColor: Colors.grey,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          controller: controller,
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: isFontSizeAuto ? (14 / 50) * height : fontSize ?? 14,
              color: hintTextColor,
            ),
            fillColor: filledColor,
            filled: true,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            suffixIcon: suffixIcon,
            errorText: errorText,
          ),
        ),
      );
    });
  }
}
