import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class PromptDetailsNavigator with NoRoutes {
  PromptDetailsNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
