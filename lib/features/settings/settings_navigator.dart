import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/settings/settings_initial_params.dart';
import 'package:chatgpt_prompts/features/settings/settings_page.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class SettingsNavigator with NoRoutes {
  SettingsNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin SettingsRoute {
  Future<void> openSettings(SettingsInitialParams initialParams) async {
    return appNavigator.push(
      materialRoute(getIt<SettingsPage>(param1: initialParams)),
    );
  }

  AppNavigator get appNavigator;
}
