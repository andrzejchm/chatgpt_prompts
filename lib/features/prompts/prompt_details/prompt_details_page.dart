// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/widgets/execute_button.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/widgets/prompt_details_header_sliver.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/widgets/prompt_details_variables_sliver.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          Widget horizontalPadding(Widget sliver) => SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: dimens.spacingM),
                sliver: sliver,
              );

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverGap(dimens.spacingM),
                      horizontalPadding(
                        PromptDetailsHeaderSliver(
                          prompt: state.prompt,
                          onTapEdit: presenter.onTapEdit,
                          onTapTemplate: presenter.onTapTemplate,
                        ),
                      ),
                      SliverGap(dimens.spacingL),
                      horizontalPadding(
                        PromptDetailsVariablesSliver(
                          prompt: state.prompt,
                          onValueChanged: presenter.onVariableValueChanged,
                        ),
                      ),
                      SliverGap(dimens.spacingM),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(dimens.spacingM),
                  child: ExecuteButton(presenter: presenter),
                ),
              ],
            ),
          );
        },
      );
}
