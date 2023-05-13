import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_template_variable.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:chatgpt_prompts/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class PromptVariableInput extends StatefulWidget {
  const PromptVariableInput({
    super.key,
    required this.item,
    required this.onChanged,
    required this.value,
  });

  final PromptTemplateVariable item;
  final ValueChanged<String> onChanged;
  final String value;

  @override
  State<PromptVariableInput> createState() => _PromptVariableInputState();
}

class _PromptVariableInputState extends State<PromptVariableInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value) //
      ..addListener(() => widget.onChanged(_controller.text));
  }

  @override
  void didUpdateWidget(covariant PromptVariableInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = textStylesOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: dimens.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.slug,
            style: textStyles.titleSmall?.copyWith(),
          ),
          Text(
            widget.item.description,
            style: textStyles.labelSmall?.copyWith(
              color: colorsOf(context).onSurfaceVariant,
            ),
          ),
          AppTextField(
            controller: _controller,
            maxLines: null,
            style: textStyles.bodySmall,
          ),
        ],
      ),
    );
  }
}
