//chat message class extending equatable, with copyWith method and 2 fields: ChatCompletionRole and message
import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_role.dart';
import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.message,
    required this.role,
  });

  const ChatMessage.user({
    required this.message,
  }) : role = ChatCompletionRole.user;

  const ChatMessage.system({
    required this.message,
  }) : role = ChatCompletionRole.system;

  const ChatMessage.assistant({
    required this.message,
  }) : role = ChatCompletionRole.assistant;

  final String message;
  final ChatCompletionRole role;

  @override
  List<Object?> get props => [
        message,
        role,
      ];

  //copyWith method
  ChatMessage copyWith({
    String? message,
    ChatCompletionRole? role,
  }) {
    return ChatMessage(
      message: message ?? this.message,
      role: role ?? this.role,
    );
  }

  ChatCompletionMessageInput toInput() => ChatCompletionMessageInput(
        message: message,
        role: role,
      );
}
