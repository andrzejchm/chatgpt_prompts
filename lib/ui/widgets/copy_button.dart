import 'package:chatgpt_prompts/core/utils/durations.dart';
import 'package:chatgpt_prompts/localization/app_localizations_utils.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({
    super.key,
    required this.text,
  });

  final String text;

  void _onTap(BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(appLocalizations.copiedToClipboard),
        duration: const LongDuration(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => _onTap(context),
      child: Row(
        children: [
          Text(appLocalizations.copyAction),
          Gap(dimens.spacingS),
          const Icon(
            Icons.copy,
            size: 16,
          ),
        ],
      ),
    );
  }
}
