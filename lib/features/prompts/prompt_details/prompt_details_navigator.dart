import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_page.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class PromptDetailsNavigator with NoRoutes {
  PromptDetailsNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
