import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_initial_params.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_page.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:chatgpt_prompts/navigation/error_dialog_route.dart';
import 'package:chatgpt_prompts/navigation/no_routes.dart';

class ChatNavigator with NoRoutes, ErrorDialogRoute {
  ChatNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin ChatRoute {
  Future<void> openChat(ChatInitialParams initialParams) async {
    return appNavigator.push(
      platformRoute(
        getIt<ChatPage>(param1: initialParams),
      ),
    );
  }

  AppNavigator get appNavigator;
}
