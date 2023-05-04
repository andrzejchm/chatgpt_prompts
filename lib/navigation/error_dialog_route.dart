import 'package:flutter/material.dart';
import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:chatgpt_prompts/localization/app_localizations_utils.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';

mixin ErrorDialogRoute {
  Future<void> showError(DisplayableFailure failure, {BuildContext? context}) {
    logError(failure);
    return showDialog(
      context: context ?? AppNavigator.navigatorKey.currentContext!,
      builder: (context) => ErrorDialog(failure: failure),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.failure,
    super.key,
  });

  final DisplayableFailure failure;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(failure.title),
      content: Text(failure.message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(appLocalizations.okAction),
        ),
      ],
    );
  }
}
