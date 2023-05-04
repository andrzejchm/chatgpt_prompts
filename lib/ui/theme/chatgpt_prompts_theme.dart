import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_colors.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_dimens.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_text_styles.dart';
import 'package:flutter/cupertino.dart';

class ChatgptPromptsTheme extends InheritedWidget {
  const ChatgptPromptsTheme({
    super.key,
    this.colors = const ChatgptPromptsColors(),
    this.textStyles = const ChatgptPromptsTextStyles(),
    this.dimens = const ChatgptPromptsDimens(),
    required super.child,
  });

  static ChatgptPromptsTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ChatgptPromptsTheme>();
    assert(result != null, 'No ChatgptPromptsTheme found in context');

    return result!;
  }

  final ChatgptPromptsColors colors;
  final ChatgptPromptsTextStyles textStyles;
  final ChatgptPromptsDimens dimens;

  @override
  bool updateShouldNotify(ChatgptPromptsTheme oldWidget) =>
      colors != oldWidget.colors || textStyles != oldWidget.textStyles;
}

extension ContextTheme on BuildContext {
  ChatgptPromptsTheme get theme => ChatgptPromptsTheme.of(this);
}
