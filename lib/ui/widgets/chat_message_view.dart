import 'dart:math';

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
    return Stack(
      children: [
        Align(
          alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              isUser ? dimens.spacingM : dimens.spacingXXL,
              dimens.spacingM,
              isUser ? dimens.spacingXXL : dimens.spacingM,
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
                    style: textStyles.caption,
                    textAlign: isUser ? TextAlign.left : TextAlign.right,
                  ),
                  Gap(dimens.spacingS),
                  Container(
                    decoration: BoxDecoration(
                      color: role.color,
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
                        _message.message,
                        style: textStyles.body1,
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
  Color get color {
    switch (this) {
      case ChatCompletionRole.assistant:
        return colors.tertiaryContainer;
      case ChatCompletionRole.user:
        return colors.secondaryContainer;
      case ChatCompletionRole.system:
        return colors.surfaceVariant;
    }
  }
}
