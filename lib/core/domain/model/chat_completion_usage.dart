import 'package:equatable/equatable.dart';

class ChatCompletionUsage extends Equatable {
  const ChatCompletionUsage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  const ChatCompletionUsage.empty()
      : promptTokens = 0,
        completionTokens = 0,
        totalTokens = 0;

  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  @override
  List<Object?> get props => [
        promptTokens,
        completionTokens,
        totalTokens,
      ];

  //copyWith
  ChatCompletionUsage copyWith({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) {
    return ChatCompletionUsage(
      promptTokens: promptTokens ?? this.promptTokens,
      completionTokens: completionTokens ?? this.completionTokens,
      totalTokens: totalTokens ?? this.totalTokens,
    );
  }
}
