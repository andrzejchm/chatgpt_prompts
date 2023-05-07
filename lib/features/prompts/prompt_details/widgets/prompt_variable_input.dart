import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_template_variable.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:chatgpt_prompts/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PromptVariableInput extends StatelessWidget {
  const PromptVariableInput({
    super.key,
    required this.item,
    required this.onChanged,
  });

  final PromptTemplateVariable item;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final textStyles = textStylesOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: dimens.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.slug,
            style: textStyles.titleSmall?.copyWith(),
          ),
          Gap(dimens.spacingM),
          AppTextField(
            label: Text(item.description, style: textStyles.labelSmall),
            maxLines: null,
            style: textStyles.bodySmall,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
