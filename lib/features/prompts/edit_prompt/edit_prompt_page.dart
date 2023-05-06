// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presenter.dart';

class EditPromptPage extends StatefulWidget with HasPresenter<EditPromptPresenter> {
  const EditPromptPage({
    required this.presenter,
    super.key,
  });

  @override
  final EditPromptPresenter presenter;

  @override
  State<EditPromptPage> createState() => _EditPromptPageState();
}

class _EditPromptPageState extends State<EditPromptPage>
    with PresenterStateMixin<EditPromptViewModel, EditPromptPresenter, EditPromptPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('EditPromptPage\n(NOT IMPLEMENTED YET)'),
        ),
      );
}
