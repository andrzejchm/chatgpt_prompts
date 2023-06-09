import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.label,
    this.minLines,
    this.maxLines = 1,
    this.style,
    this.fillColor,
    this.filled = true,
    this.onChanged,
  });

  final String? hintText;
  final TextEditingController? controller;
  final Widget? label;
  final int? minLines;
  final int? maxLines;
  final TextStyle? style;
  final Color? fillColor;
  final bool filled;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines,
      style: style,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        label: label,
        hintText: hintText,
        fillColor: fillColor ?? colorsOf(context).surfaceVariant,
        filled: filled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dimens.spacingM),
        ),
      ),
    );
  }
}
