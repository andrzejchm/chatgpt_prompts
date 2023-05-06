import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';
import 'package:flutter/material.dart';

class PromptsSidePanel extends StatelessWidget {
  const PromptsSidePanel({
    super.key,
    required this.presenter,
  });

  final PromptsListPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return PromptsListPage(
      presenter: presenter,
    );
  }
}
