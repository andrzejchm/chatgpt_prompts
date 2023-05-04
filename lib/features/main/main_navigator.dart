import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/main/main_initial_params.dart';
import 'package:chatgpt_prompts/features/main/main_page.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class MainNavigator with NoRoutes {

  MainNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin MainRoute {
  Future<void> openMain(MainInitialParams initialParams) async {
    return appNavigator.push(
      materialRoute(getIt<MainPage>(param1: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
