import 'package:chatgpt_prompts/core/utils/platforms.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/app_init/app_init_initial_params.dart';
import 'package:chatgpt_prompts/features/app_init/app_init_page.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:chatgpt_prompts/utils/locale_resolution.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ChatgptPromptsApp extends StatefulWidget {
  const ChatgptPromptsApp({
    super.key,
    this.home,
  });

  final Widget? home;

  @override
  State<ChatgptPromptsApp> createState() => _ChatgptPromptsAppState();
}

class _ChatgptPromptsAppState extends State<ChatgptPromptsApp> {
  late Widget home;

  @override
  void initState() {
    home = widget.home ?? getIt<AppInitPage>(param1: const AppInitInitialParams());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: appTheme.colorsLight,
        scaffoldBackgroundColor: appTheme.colorsLight.background,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: appTheme.colorsDark,
        scaffoldBackgroundColor: appTheme.colorsDark.background,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeListResolutionCallback: localeResolution,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) => Platforms.isDesktopPlatform
          ? MediaQuery(
              data: MediaQuery.of(context).copyWith(
                // accounts for close/maximize/minimize buttons
                padding: const EdgeInsets.only(top: 24),
              ),
              child: child!,
            )
          : child!,
    );
  }
}
