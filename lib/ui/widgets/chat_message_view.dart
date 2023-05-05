import 'package:chatgpt_prompts/core/domain/model/chat_completion_role.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_message.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ChatMessageView extends StatelessWidget {
  const ChatMessageView({
    super.key,
    required ChatMessage message,
  }) : _message = message;

  final ChatMessage _message;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _message.role.color,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppTheme.dimens.spacingL,
          vertical: AppTheme.dimens.spacingM,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _message.role.name,
              style: AppTheme.textStyles.caption,
            ),
            Text(
              _message.message,
              style: AppTheme.textStyles.body1,
            ),
          ],
        ),
      ),
    );
  }
}

//extension for ChatCompletionRole to get color
extension ChatCompletionRoleX on ChatCompletionRole {
  Color get color {
    const opacity = 0.1;
    switch (this) {
      case ChatCompletionRole.assistant:
        return Colors.blue.withOpacity(opacity);
      case ChatCompletionRole.user:
        return Colors.green.withOpacity(opacity);
      case ChatCompletionRole.system:
        return Colors.red.withOpacity(opacity);
    }
  }
}
