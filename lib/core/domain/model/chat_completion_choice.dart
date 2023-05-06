import 'package:chatgpt_prompts/core/domain/model/chat_message.dart';
import 'package:equatable/equatable.dart';

// /// The [index] of the choice.
// final int index;
//
// /// The [message] of the choice.
// final OpenAIChatCompletionChoiceMessageModel message;
//
// /// The [finishReason] of the choice.
// final String? finishReason;
class ChatCompletionChoice extends Equatable {
  const ChatCompletionChoice({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  final int index;
  final ChatMessage message;
  final String? finishReason;

  @override
  List<Object?> get props => [
        index,
        message,
        finishReason,
      ];

  //copyWith
  ChatCompletionChoice copyWith({
    int? index,
    ChatMessage? message,
    String? finishReason,
  }) {
    return ChatCompletionChoice(
      index: index ?? this.index,
      message: message ?? this.message,
      finishReason: finishReason ?? this.finishReason,
    );
  }
}
