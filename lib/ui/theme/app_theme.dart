import 'package:chatgpt_prompts/ui/theme/app_theme_data.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_dimens.dart';
import 'package:flutter/material.dart';

AppThemeData _theme = AppThemeData.defaults();

ChatgptPromptsDimens get dimens => appTheme.dimens;

TextTheme textStylesOf(BuildContext context) {
  return Theme.of(context).textTheme;
}

ColorScheme colorsOf(BuildContext context) {
  final brightness = Theme.of(context).colorScheme.brightness;
  switch (brightness) {
    case Brightness.dark:
      return appTheme.colorsDark;
    case Brightness.light:
      return appTheme.colorsLight;
  }
}

AppThemeData get appTheme => _theme;
