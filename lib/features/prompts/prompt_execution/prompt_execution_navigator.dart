import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/error_dialog_route.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class PromptExecutionNavigator with NoRoutes, ErrorDialogRoute {
  PromptExecutionNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
