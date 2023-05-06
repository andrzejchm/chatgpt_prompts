import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_page.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class EditPromptNavigator with NoRoutes {
  EditPromptNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

//ignore: unused-code
mixin EditPromptRoute {
  Future<void> openEditPrompt(EditPromptInitialParams initialParams) async {
    return appNavigator.push(
      materialRoute(getIt<EditPromptPage>(param1: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
