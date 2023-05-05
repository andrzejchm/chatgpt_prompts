import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_colors.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_dimens.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_text_styles.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_theme.dart';
import 'package:flutter/widgets.dart';

@visibleForTesting
AppThemeData? themeTestOverride;

class AppTheme {
  static ChatgptPromptsDimens get dimens => theme.dimens;

  static ChatgptPromptsTextStyles get textStyles => theme.textStyles;

  static ChatgptPromptsColors get colors => theme.colors;

  static AppThemeData get theme => themeTestOverride ?? ChatgptPromptsTheme.of(AppNavigator.rootContext!);
}
