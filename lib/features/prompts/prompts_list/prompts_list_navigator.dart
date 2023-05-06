import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class PromptsListNavigator with NoRoutes {
  PromptsListNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
