import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PromptsSidePanel extends StatelessWidget {
  const PromptsSidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors(context).surfaceVariant,
    );
  }
}
