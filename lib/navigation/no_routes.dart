import 'package:chatgpt_prompts/navigation/app_navigator.dart';

/// used with navigators that don't have any routes (yet).
mixin NoRoutes {
  AppNavigator get appNavigator;
}
