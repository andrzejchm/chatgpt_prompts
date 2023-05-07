import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.onTap,
    this.text,
    this.icon,
    this.iconSize = defaultIconSize,
  }) : assert(text != null || icon != null);

  static const defaultIconSize = 20.0;
  static const defaultIconPadding = 8;

  final VoidCallback? onTap;
  final String? text;
  final IconData? icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dimens.radiusM),
        ),
        padding: EdgeInsets.only(
          left: dimens.spacingXL,
          right: icon == null ? dimens.spacingXL : dimens.spacingXL - defaultIconPadding,
          top: dimens.spacingL,
          bottom: dimens.spacingL,
        ),
        textStyle: textStylesOf(context).titleMedium?.copyWith(
              color: colorsOf(context).onPrimary,
            ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (text != null) Text(text!),
          if (text != null && icon != null) Gap(dimens.spacingM),
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Icon(
                icon,
                size: iconSize,
              ),
            ),
        ],
      ),
    );
  }
}
