// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/widgets/prompts_list_item.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PromptsListPage extends StatefulWidget with HasPresenter<PromptsListPresenter> {
  const PromptsListPage({
    required this.presenter,
    super.key,
  });

  @override
  final PromptsListPresenter presenter;

  @override
  State<PromptsListPage> createState() => _PromptsListPageState();
}

class _PromptsListPageState extends State<PromptsListPage>
    with PresenterStateMixin<PromptsListViewModel, PromptsListPresenter, PromptsListPage> {
  @override
  void initState() {
    super.initState();
    presenter.onInit();
  }

  @override
  Widget build(BuildContext context) => stateObserver(
        builder: (context, state) => Scaffold(
          backgroundColor: colors(context).surface,
          body: ListView.builder(
            itemCount: state.prompts.length,
            itemBuilder: (context, index) {
              final prompt = state.prompts[index];
              return PromptsListItem(
                selected: state.selectedPrompt == prompt,
                prompt: prompt,
                onTap: () => presenter.onTapPrompt(index),
              );
            },
          ),
        ),
      );
}
