// ignore_for_file: unused-code
import 'dart:async';
import 'dart:ui';

import 'package:chatgpt_prompts/chatgpt_prompts_app.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    },
    (error, stack) => logError(error, stack),
  );
}
