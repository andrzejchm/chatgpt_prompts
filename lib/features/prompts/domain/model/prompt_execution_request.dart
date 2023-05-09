//domain entity with prompt, map of variable to its value, copyWith method and `empty` constructor
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:equatable/equatable.dart';

class PromptExecutionRequest extends Equatable {
  const PromptExecutionRequest({
    required this.prompt,
    required this.variablesValues,
  });

  const PromptExecutionRequest.empty()
      : prompt = const Prompt.empty(),
        variablesValues = const {};
  final Prompt prompt;

  final Map<String, String> variablesValues;

  @override
  List<Object?> get props => [
        prompt,
        variablesValues,
      ];

  //copyWith

  String compileTemplate() {
    return prompt.template.replaceAllMapped(
      RegExp(_wrapIntoVariable('(.*?)')),
      (match) => variablesValues[match.group(1)] ?? _wrapIntoVariable(match.group(1)!),
    );
  }

  PromptExecutionRequest copyWith({
    Prompt? prompt,
    Map<String, String>? variablesValues,
  }) {
    return PromptExecutionRequest(
      prompt: prompt ?? this.prompt,
      variablesValues: variablesValues ?? this.variablesValues,
    );
  }

  String _wrapIntoVariable(String slug) => '{{$slug}}';
}
