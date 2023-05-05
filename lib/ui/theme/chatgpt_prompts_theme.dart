import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_colors.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_dimens.dart';
import 'package:chatgpt_prompts/ui/theme/chatgpt_prompts_text_styles.dart';
import 'package:flutter/cupertino.dart';

class ChatgptPromptsTheme extends InheritedWidget {
  ChatgptPromptsTheme({
    super.key,
    AppThemeData? data,
    required super.child,
  }) : data = data ?? AppThemeData.defaults();

  static AppThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ChatgptPromptsTheme>();
    assert(result != null, 'No ChatgptPromptsTheme found in context');

    return result!.data;
  }

  final AppThemeData data;

  @override
  bool updateShouldNotify(ChatgptPromptsTheme oldWidget) => data != oldWidget.data;
}

class AppThemeData {
  const AppThemeData({
    required this.colors,
    required this.textStyles,
    required this.dimens,
  });

  AppThemeData.defaults()
      : colors = const ChatgptPromptsColors(),
        textStyles = ChatgptPromptsTextStyles.defaultStyle(),
        dimens = const ChatgptPromptsDimens();

  final ChatgptPromptsColors colors;
  final ChatgptPromptsTextStyles textStyles;
  final ChatgptPromptsDimens dimens;
}
