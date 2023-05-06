import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class PromptsNavigator with NoRoutes {
  PromptsNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
