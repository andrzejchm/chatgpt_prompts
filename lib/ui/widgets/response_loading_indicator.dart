import 'package:chatgpt_prompts/core/utils/durations.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:chatgpt_prompts/ui/widgets/app_progress_indicator.dart';
import 'package:flutter/material.dart';

class ResponseLoadingIndicator extends StatelessWidget {
  const ResponseLoadingIndicator({
    super.key,
    required this.isLoading,
  });

  static const loadingSize = 20.0;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const ShortDuration(),
      curve: Curves.easeInOut,
      child: Padding(
        padding: EdgeInsets.only(top: AppTheme.dimens.spacingS),
        child: SizedBox(
          height: isLoading ? loadingSize : 0,
          width: loadingSize,
          child: const AppProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
