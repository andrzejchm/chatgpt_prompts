import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PromptsListItem extends StatelessWidget {
  const PromptsListItem({
    super.key,
    required this.prompt,
    required this.onTap,
    required this.selected,
  });

  final Prompt prompt;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? colorsOf(context).onSecondary : Colors.transparent,
      child: ListTile(
        dense: true,
        title: Text(prompt.name),
        subtitle: Text(
          prompt.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTap,
      ),
    );
  }
}
