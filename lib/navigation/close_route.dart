// ignore_for_file: unused-code, unused-files
import 'package:chatgpt_prompts/navigation/app_navigator.dart';

mixin CloseRoute {
  AppNavigator get appNavigator;

  void close() => appNavigator.close();
}
