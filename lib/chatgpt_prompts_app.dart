import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/app_init/app_init_initial_params.dart';
import 'package:chatgpt_prompts/features/app_init/app_init_page.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_theme.dart';
import 'package:chatgpt_prompts/utils/locale_resolution.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ChatgptPromptsApp extends StatefulWidget {
  const ChatgptPromptsApp({super.key});

  @override
  State<ChatgptPromptsApp> createState() => _ChatgptPromptsAppState();
}

class _ChatgptPromptsAppState extends State<ChatgptPromptsApp> {
  late AppInitPage page;

  @override
  void initState() {
    page = getIt<AppInitPage>(param1: const AppInitInitialParams());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChatgptPromptsTheme(
      child: MaterialApp(
        home: page,
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
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        ),
      ),
    );
  }
}
