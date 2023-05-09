import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({
    super.key,
    required this.text,
  });

  static const opacity = 0.3;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = colorsOf(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dimens.radiusM),
        border: Border.all(
          color: colors.onSurfaceVariant.withOpacity(opacity),
        ),
        color: colors.surfaceVariant.withOpacity(opacity),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(dimens.spacingL),
          child: SelectableText(
            text,
          ),
        ),
      ),
    );
  }
}
