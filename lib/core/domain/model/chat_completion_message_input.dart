//data class with message and role
import 'package:chatgpt_prompts/core/domain/model/chat_completion_role.dart';
import 'package:equatable/equatable.dart';

class ChatCompletionMessageInput extends Equatable {
  const ChatCompletionMessageInput({
    required this.message,
    required this.role,
  });

  const ChatCompletionMessageInput.user({
    required this.message,
  }) : role = ChatCompletionRole.user;

  const ChatCompletionMessageInput.system({
    required this.message,
  }) : role = ChatCompletionRole.system;

  const ChatCompletionMessageInput.assistant({
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
  ChatCompletionMessageInput copyWith({
    String? message,
    ChatCompletionRole? role,
  }) {
    return ChatCompletionMessageInput(
      message: message ?? this.message,
      role: role ?? this.role,
    );
  }
}
