import 'package:chatgpt_prompts/navigation/app_navigator.dart';

// ignore_for_file: unused-code, unused-files
mixin CloseWithResultRoute<T> {
  AppNavigator get appNavigator;

  void closeWithResult(T? result) => appNavigator.closeWithResult(result);
}
