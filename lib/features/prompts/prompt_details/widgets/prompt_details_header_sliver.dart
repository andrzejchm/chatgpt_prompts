import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PromptDetailsHeaderSliver extends StatelessWidget {
  const PromptDetailsHeaderSliver({
    super.key,
    required this.prompt,
    required this.onTapEdit,
    required this.onTapTemplate,
  });

  final Prompt prompt;
  final VoidCallback onTapEdit;
  final VoidCallback onTapTemplate;

  @override
  Widget build(BuildContext context) {
    final textStyles = textStylesOf(context);
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      key: const ValueKey('prompt_details_header_title'),
                      prompt.name,
                      style: textStyles.titleMedium,
                    ),
                    Gap(dimens.spacingS),
                    Text(
                      key: const ValueKey('prompt_details_header_description'),
                      prompt.description,
                      style: textStyles.labelSmall,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onTapEdit,
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          const Text('#Template:'),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: colorsOf(context).tertiaryContainer,
                    borderRadius: BorderRadius.circular(dimens.radiusM),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: dimens.spacingM, vertical: dimens.spacingS),
                    child: Text(
                      prompt.template.replaceAll('\n', ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.labelSmall?.copyWith(
                        color: colorsOf(context).onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: onTapTemplate,
                icon: const Icon(
                  Icons.info,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
