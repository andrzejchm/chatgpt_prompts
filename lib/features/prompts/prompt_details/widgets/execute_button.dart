import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import 'package:chatgpt_prompts/localization/app_localizations_utils.dart';
import 'package:chatgpt_prompts/ui/widgets/app_filled_button.dart';
import 'package:flutter/material.dart';

class ExecuteButton extends StatelessWidget {
  const ExecuteButton({
    super.key,
    required this.presenter,
  });

  final PromptDetailsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return AppFilledButton(
      text: appLocalizations.actionExecute,
      icon: Icons.play_arrow,
      onTap: presenter.onTapExecute,
    );
  }
}
