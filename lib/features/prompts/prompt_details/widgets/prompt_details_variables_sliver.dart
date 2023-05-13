import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/widgets/prompt_variable_input.dart';
import 'package:flutter/material.dart';

typedef VariableValueChangedCallback = void Function(String slug, String value);

class PromptDetailsVariablesSliver extends StatelessWidget {
  const PromptDetailsVariablesSliver({
    super.key,
    required this.prompt,
    required this.onValueChanged,
    required this.formData,
  });

  final Prompt prompt;
  final VariableValueChangedCallback onValueChanged;
  final PromptExecutionFormData formData;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = prompt.variables[index];
          return PromptVariableInput(
            item: item,
            value: formData.getVariableValue(item.slug) ?? '',
            onChanged: (value) => onValueChanged(item.slug, value),
          );
        },
        childCount: prompt.variables.length,
      ),
    );
  }
}
