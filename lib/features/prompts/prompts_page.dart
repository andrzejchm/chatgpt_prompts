// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';

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
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('PromptsPage\n(NOT IMPLEMENTED YET)'),
        ),
      );
}
