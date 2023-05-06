import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_navigator.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class PromptsListNavigator with NoRoutes, EditPromptRoute {
  PromptsListNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
