import 'package:chatgpt_prompts/core/domain/model/chat_completion_role.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_message.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChatMessageView extends StatelessWidget {
  const ChatMessageView({
    super.key,
    required ChatMessage message,
  }) : _message = message;
  final ChatMessage _message;

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(dimens.radiusL);
    final role = _message.role;
    final isUser = role == ChatCompletionRole.user;
    final textStyles = textStylesOf(context);
    return Stack(
      children: [
        Align(
          alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              isUser ? dimens.spacingM : dimens.spacingXXXL,
              dimens.spacingM,
              isUser ? dimens.spacingXXXL : dimens.spacingM,
              dimens.spacingM,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role.name,
                    style: textStyles.bodySmall,
                    textAlign: isUser ? TextAlign.left : TextAlign.right,
                  ),
                  Gap(dimens.spacingS),
                  Container(
                    decoration: BoxDecoration(
                      color: role.color(context),
                      borderRadius: BorderRadius.only(
                        topLeft: isUser ? Radius.zero : radius,
                        topRight: isUser ? radius : Radius.zero,
                        bottomLeft: radius,
                        bottomRight: radius,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: dimens.spacingL,
                        vertical: dimens.spacingM,
                      ),
                      child: Text(
                        _message.content,
                        style: textStyles.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//extension for ChatCompletionRole to get color
extension ChatCompletionRoleX on ChatCompletionRole {
  Color color(BuildContext context) {
    switch (this) {
      case ChatCompletionRole.assistant:
        return colorsOf(context).tertiaryContainer;
      case ChatCompletionRole.user:
        return colorsOf(context).secondaryContainer;
      case ChatCompletionRole.system:
        return colorsOf(context).surfaceVariant;
    }
  }
}
