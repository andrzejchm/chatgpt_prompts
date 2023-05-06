import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_page.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class PromptsNavigator with NoRoutes {
  PromptsNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin PromptsRoute {
  Future<void> openPrompts(PromptsInitialParams initialParams) async {
    return appNavigator.push(
      materialRoute(getIt<PromptsPage>(param1: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
