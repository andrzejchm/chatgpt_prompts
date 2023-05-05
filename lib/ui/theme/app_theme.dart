import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme_data.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_dimens.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_text_styles.dart';
import 'package:flutter/material.dart';

AppThemeData _theme = AppThemeData.defaults();

ChatgptPromptsDimens get dimens => appTheme.dimens;

ChatgptPromptsTextStyles get textStyles => appTheme.textStyles;

ColorScheme get colors {
  final brightness = Theme.of(AppNavigator.rootContext!).colorScheme.brightness;
  switch (brightness) {
    case Brightness.dark:
      return appTheme.colorsDark;
    case Brightness.light:
      return appTheme.colorsLight;
  }
}

AppThemeData get appTheme => _theme;
