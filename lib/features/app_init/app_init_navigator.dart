import 'package:chatgpt_prompts/features/chats/chat/chat_navigator.dart';
import 'package:chatgpt_prompts/features/main/main_navigator.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/error_dialog_route.dart';

class AppInitNavigator with MainRoute, ChatRoute, ErrorDialogRoute {
  AppInitNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}
