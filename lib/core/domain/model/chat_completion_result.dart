import 'package:chatgpt_prompts/core/domain/model/chat_completion_choice.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_usage.dart';
import 'package:equatable/equatable.dart';

class ChatCompletionResult extends Equatable {
  const ChatCompletionResult({
    required this.id,
    required this.createdUtc,
    required this.choices,
    required this.usage,
  });

  const ChatCompletionResult.empty()
      : id = '',
        createdUtc = '1970-01-01T00:00:00.000000Z',
        choices = const [],
        usage = const ChatCompletionUsage.empty();

  final String id;
  final String createdUtc;
  final List<ChatCompletionChoice> choices;
  final ChatCompletionUsage usage;

  @override
  List<Object?> get props => [
        id,
        createdUtc,
        choices,
        usage,
      ];

  //copyWith
  ChatCompletionResult copyWith({
    String? id,
    String? createdUtc,
    List<ChatCompletionChoice>? choices,
    ChatCompletionUsage? usage,
  }) {
    return ChatCompletionResult(
      id: id ?? this.id,
      createdUtc: createdUtc ?? this.createdUtc,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
    );
  }
}
