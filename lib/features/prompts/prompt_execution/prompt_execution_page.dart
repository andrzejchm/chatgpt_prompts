// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/widgets/result_container.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/widgets/result_footer.dart';
import 'package:chatgpt_prompts/localization/app_localizations_utils.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PromptExecutionPage extends StatefulWidget with HasPresenter<PromptExecutionPresenter> {
  const PromptExecutionPage({
    required this.presenter,
    super.key,
  });

  @override
  final PromptExecutionPresenter presenter;

  @override
  State<PromptExecutionPage> createState() => _PromptExecutionPageState();
}

class _PromptExecutionPageState extends State<PromptExecutionPage>
    with PresenterStateMixin<PromptExecutionViewModel, PromptExecutionPresenter, PromptExecutionPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: stateObserver(
          builder: (context, state) {
            final colors = colorsOf(context);
            final textStyles = textStylesOf(context);
            return Padding(
              padding: EdgeInsets.all(dimens.spacingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    appLocalizations.resultsTitle,
                    style: textStyles.labelSmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  Expanded(
                    child: ResultContainer(
                      text: state.responseText,
                    ),
                  ),
                  ResultFooter(
                    text: state.responseText,
                    chunkedResponse: state.chunkedResponse,
                    status: state.executionResult.status,
                  ),
                ],
              ),
            );
          },
        ),
      );
}
