import 'package:chatgpt_prompts/main.dart';
import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    super.key,
    required this.strokeWidth,
  });

  static const minSize = 36.0;

  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return isUnitTests
        ? const SizedBox(
            width: minSize,
            height: minSize,
          )
        : CircularProgressIndicator(
            strokeWidth: strokeWidth,
          );
  }
}
