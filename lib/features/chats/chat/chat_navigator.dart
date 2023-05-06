import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/error_dialog_route.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class ChatNavigator with NoRoutes, ErrorDialogRoute {
  ChatNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
