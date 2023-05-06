import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class SettingsNavigator with NoRoutes {
  SettingsNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
