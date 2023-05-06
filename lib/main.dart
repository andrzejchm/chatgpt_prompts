// ignore_for_file: unused-code
import 'dart:async';
import 'dart:ui';

import 'package:chatgpt_prompts/chatgpt_prompts_app.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:chatgpt_prompts/core/utils/platforms.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:window_manager/window_manager.dart';

/// flag modified by unit tests so that app's code can adapt to unit tests
/// (i.e: disable animations in progress bars etc.)
bool isUnitTests = false;

Future<void> main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    logError(details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    logError(error, stack);
    return false;
  };
  await dotenv.load();
  runZonedGuarded(
    () {
      configureDependencies();
      runApp(const ChatgptPromptsApp());
      _setWindow();
    },
    (error, stack) => logError(error, stack),
  );
}

Future<void> _setWindow() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platforms.isDesktopPlatform) {
    await windowManager.waitUntilReadyToShow(
      const WindowOptions(
        minimumSize: Size(400, 300),
      ),
      () async {
        // await windowManager.setAsFrameless();
        await windowManager.setHasShadow(true);
        await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
        // await windowManager.setBackgroundColor(colors(AppNavigator.rootContext!).primary);
      },
    );
  }
}
