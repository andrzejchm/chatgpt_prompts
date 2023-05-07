//domain entity with prompt, map of variable to its value, copyWith method and `empty` constructor
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:equatable/equatable.dart';

class PromptExecutionRequest extends Equatable {
  const PromptExecutionRequest({
    required this.prompt,
    required this.variablesValues,
  });

  final Prompt prompt;
  final Map<String, String> variablesValues;

  @override
  List<Object?> get props => [
        prompt,
        variablesValues,
      ];

  //copyWith
  PromptExecutionRequest copyWith({
    Prompt? prompt,
    Map<String, String>? variablesValues,
  }) {
    return PromptExecutionRequest(
      prompt: prompt ?? this.prompt,
      variablesValues: variablesValues ?? this.variablesValues,
    );
  }
}
