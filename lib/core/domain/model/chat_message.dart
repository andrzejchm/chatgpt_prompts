//chat message class extending equatable, with copyWith method and 2 fields: ChatCompletionRole and message
import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_role.dart';
import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.content,
    required this.role,
  });

  const ChatMessage.empty()
      : content = '',
        role = ChatCompletionRole.user;

  const ChatMessage.user({
    required this.content,
  }) : role = ChatCompletionRole.user;

  const ChatMessage.system({
    required this.content,
  }) : role = ChatCompletionRole.system;

  const ChatMessage.assistant({
    required this.content,
  }) : role = ChatCompletionRole.assistant;

  final String content;
  final ChatCompletionRole role;

  @override
  List<Object?> get props => [
        content,
        role,
      ];

  //copyWith method
  ChatMessage copyWith({
    String? content,
    ChatCompletionRole? role,
  }) {
    return ChatMessage(
      content: content ?? this.content,
      role: role ?? this.role,
    );
  }

  ChatCompletionMessageInput toInput() => ChatCompletionMessageInput(
        message: content,
        role: role,
      );
}
