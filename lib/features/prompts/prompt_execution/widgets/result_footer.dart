import 'package:chatgpt_prompts/core/domain/model/stream_result.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/localization/app_localizations_utils.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:chatgpt_prompts/ui/widgets/app_progress_indicator.dart';
import 'package:chatgpt_prompts/ui/widgets/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResultFooter extends StatelessWidget {
  const ResultFooter({
    super.key,
    required this.text,
    required this.status,
    required this.chunkedResponse,
  });

  final String text;
  final StreamStatus status;
  final CompletionStreamedChunk chunkedResponse;

  @override
  Widget build(BuildContext context) {
    const indicatorSize = 20.0;
    final Widget indicator;
    switch (status) {
      case StreamStatus.notStarted:
        indicator = const SizedBox.shrink();
        break;
      case StreamStatus.pendingFirstEmission:
      case StreamStatus.emission:
        indicator = const SizedBox(
          height: indicatorSize,
          width: indicatorSize,
          child: AppProgressIndicator(),
        );
        break;
      case StreamStatus.finished:
        indicator = Row(
          children: [
            Icon(
              //success icon
              Icons.check_circle,
              color: colorsOf(context).primary,
              size: indicatorSize,
            ),
            Gap(dimens.spacingS),
            Text(appLocalizations.finishReasonFormat(chunkedResponse.choice.finishReason)),
          ],
        );
        break;
      case StreamStatus.rejected:
        indicator = Icon(
          Icons.error,
          color: colorsOf(context).error,
          size: indicatorSize,
        );
        break;
    }
    return Padding(
      padding: EdgeInsets.only(top: dimens.spacingM),
      child: Row(
        children: [
          indicator,
          const Spacer(),
          Gap(dimens.spacingM),
          CopyButton(text: text),
        ],
      ),
    );
  }
}
