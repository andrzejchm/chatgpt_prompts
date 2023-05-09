import 'package:chatgpt_prompts/core/utils/platforms.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_dimens.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData({
    required this.colorsLight,
    required this.colorsDark,
    required this.typographyLight,
    required this.typographyDark,
    required this.dimens,
  });

  AppThemeData.defaults()
      : colorsLight = defaultSchemeLight,
        colorsDark = defaultSchemeDark,
        dimens = ChatgptPromptsDimens(),
        typographyLight = Typography.material2021(
          platform: Platforms.currentPlatform,
          colorScheme: defaultSchemeLight,
        ),
        typographyDark = Typography.material2021(
          platform: Platforms.currentPlatform,
          colorScheme: defaultSchemeDark,
        );

  final Typography typographyLight;
  final Typography typographyDark;
  final ColorScheme colorsLight;
  final ColorScheme colorsDark;
  final ChatgptPromptsDimens dimens;

  static const defaultSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006C49),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF57FEB9),
    onPrimaryContainer: Color(0xFF002113),
    secondary: Color(0xFF006877),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFA3EEFF),
    onSecondaryContainer: Color(0xFF001F25),
    tertiary: Color(0xFF006A68),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF6FF7F3),
    onTertiaryContainer: Color(0xFF00201F),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFDF8),
    onBackground: Color(0xFF191C1A),
    surface: Color(0xFFFBFDF8),
    onSurface: Color(0xFF191C1A),
    surfaceVariant: Color(0xFFDCE5DD),
    onSurfaceVariant: Color(0xFF404943),
    outline: Color(0xFF707973),
    onInverseSurface: Color(0xFFEFF1ED),
    inverseSurface: Color(0xFF2E312F),
    inversePrimary: Color(0xFF2DE19E),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006C49),
    outlineVariant: Color(0xFFC0C9C1),
    scrim: Color(0xFF000000),
  );

  static const defaultSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF2DE19E),
    onPrimary: Color(0xFF003824),
    primaryContainer: Color(0xFF005236),
    onPrimaryContainer: Color(0xFF57FEB9),
    secondary: Color(0xFF52D7F0),
    onSecondary: Color(0xFF00363F),
    secondaryContainer: Color(0xFF004E5A),
    onSecondaryContainer: Color(0xFFA3EEFF),
    tertiary: Color(0xFF4DDAD6),
    onTertiary: Color(0xFF003736),
    tertiaryContainer: Color(0xFF00504E),
    onTertiaryContainer: Color(0xFF6FF7F3),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1A),
    onBackground: Color(0xFFE1E3DF),
    surface: Color(0xFF191C1A),
    onSurface: Color(0xFFE1E3DF),
    surfaceVariant: Color(0xFF404943),
    onSurfaceVariant: Color(0xFFC0C9C1),
    outline: Color(0xFF8A938C),
    onInverseSurface: Color(0xFF191C1A),
    inverseSurface: Color(0xFFE1E3DF),
    inversePrimary: Color(0xFF006C49),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF2DE19E),
    outlineVariant: Color(0xFF404943),
    scrim: Color(0xFF000000),
  );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        typography: typographyLight,
        colorScheme: colorsDark,
        scaffoldBackgroundColor: colorsDark.background,
      );

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        typography: typographyLight,
        colorScheme: colorsLight,
        scaffoldBackgroundColor: colorsLight.background,
      );
}
