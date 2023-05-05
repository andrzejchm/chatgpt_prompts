import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_dimens.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_text_styles.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData({
    required this.colorsLight,
    required this.colorsDark,
    required this.textStyles,
    required this.dimens,
  });

  AppThemeData.defaults()
      : colorsLight = defaultSchemeLight,
        colorsDark = defaultSchemeDark,
        textStyles = ChatgptPromptsTextStyles.defaultStyle(),
        dimens = ChatgptPromptsDimens();

  final ColorScheme colorsLight;
  final ColorScheme colorsDark;
  final ChatgptPromptsTextStyles textStyles;
  final ChatgptPromptsDimens dimens;

  static const defaultSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF005DB6),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD6E3FF),
    onPrimaryContainer: Color(0xFF001B3D),
    secondary: Color(0xFF295EA7),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD6E3FF),
    onSecondaryContainer: Color(0xFF001B3E),
    tertiary: Color(0xFF875200),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFDDBA),
    onTertiaryContainer: Color(0xFF2B1700),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFF8FDFF),
    onBackground: Color(0xFF001F25),
    surface: Color(0xFFF8FDFF),
    onSurface: Color(0xFF001F25),
    surfaceVariant: Color(0xFFE0E2EC),
    onSurfaceVariant: Color(0xFF44474E),
    outline: Color(0xFF74777F),
    onInverseSurface: Color(0xFFD6F6FF),
    inverseSurface: Color(0xFF00363F),
    inversePrimary: Color(0xFFA9C7FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF005DB6),
    outlineVariant: Color(0xFFC4C6CF),
    scrim: Color(0xFF000000),
  );

  static const defaultSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFA9C7FF),
    onPrimary: Color(0xFF003063),
    primaryContainer: Color(0xFF00468B),
    onPrimaryContainer: Color(0xFFD6E3FF),
    secondary: Color(0xFFAAC7FF),
    onSecondary: Color(0xFF003064),
    secondaryContainer: Color(0xFF00468C),
    onSecondaryContainer: Color(0xFFD6E3FF),
    tertiary: Color(0xFFFFB866),
    onTertiary: Color(0xFF482900),
    tertiaryContainer: Color(0xFF673D00),
    onTertiaryContainer: Color(0xFFFFDDBA),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF001F25),
    onBackground: Color(0xFFA6EEFF),
    surface: Color(0xFF001F25),
    onSurface: Color(0xFFA6EEFF),
    surfaceVariant: Color(0xFF44474E),
    onSurfaceVariant: Color(0xFFC4C6CF),
    outline: Color(0xFF8E9099),
    onInverseSurface: Color(0xFF001F25),
    inverseSurface: Color(0xFFA6EEFF),
    inversePrimary: Color(0xFF005DB6),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFA9C7FF),
    outlineVariant: Color(0xFF44474E),
    scrim: Color(0xFF000000),
  );
}
