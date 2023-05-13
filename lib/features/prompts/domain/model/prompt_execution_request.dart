//domain entity with prompt, map of variable to its value, copyWith method and `empty` constructor
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:equatable/equatable.dart';

class PromptExecutionRequest extends Equatable {
  const PromptExecutionRequest({
    required this.prompt,
    required this.formData,
  });

  const PromptExecutionRequest.empty()
      : prompt = const Prompt.empty(),
        formData = const PromptExecutionFormData.empty();

  final Prompt prompt;

  final PromptExecutionFormData formData;

  @override
  List<Object?> get props => [
        prompt,
        formData,
      ];

  //copyWith

  String compileTemplate() {
    return prompt.template.replaceAllMapped(
      RegExp(_varMarkup('(.*?)')),
      (match) {
        final varSlug = match.group(1) ?? '';
        return formData.getVariableValue(varSlug) ?? _varMarkup(varSlug);
      },
    );
  }

  PromptExecutionRequest copyWith({
    Prompt? prompt,
    PromptExecutionFormData? formData,
  }) {
    return PromptExecutionRequest(
      prompt: prompt ?? this.prompt,
      formData: formData ?? this.formData,
    );
  }

  String _varMarkup(String slug) => '{{$slug}}';
}
