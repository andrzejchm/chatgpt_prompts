import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:flutter/material.dart';

class PromptsListItem extends StatelessWidget {
  const PromptsListItem({
    super.key,
    required this.prompt,
    required this.onTap,
  });

  final Prompt prompt;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(prompt.name),
      subtitle: Text(
        prompt.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
