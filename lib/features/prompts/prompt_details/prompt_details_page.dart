// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import 'package:flutter/material.dart';

class PromptDetailsPage extends StatefulWidget with HasPresenter<PromptDetailsPresenter> {
  const PromptDetailsPage({
    required this.presenter,
    super.key,
  });

  @override
  final PromptDetailsPresenter presenter;

  @override
  State<PromptDetailsPage> createState() => _PromptDetailsPageState();
}

class _PromptDetailsPageState extends State<PromptDetailsPage>
    with PresenterStateMixin<PromptDetailsViewModel, PromptDetailsPresenter, PromptDetailsPage> {
  @override
  Widget build(BuildContext context) => stateObserver(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Text(state.prompt.name),
            ),
          );
        },
      );
}
