// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/widgets/prompts_side_panel.dart';
import 'package:chatgpt_prompts/ui/widgets/resizable_row.dart';
import 'package:flutter/material.dart';

class PromptsPage extends StatefulWidget with HasPresenter<PromptsPresenter> {
  const PromptsPage({
    required this.presenter,
    super.key,
  });

  @override
  final PromptsPresenter presenter;

  @override
  State<PromptsPage> createState() => _PromptsPageState();
}

class _PromptsPageState extends State<PromptsPage>
    with PresenterStateMixin<PromptsViewModel, PromptsPresenter, PromptsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ResizableRow(
          panel: (_) => stateObserver(
            builder: (context, state) {
              return PromptsSidePanel(
                presenter: state.promptsListPresenter,
              );
            },
          ),
          details: (_) => PromptDetailsPage(
            presenter: state.promptDetailsPresenter,
          ),
        ),
      );
}
