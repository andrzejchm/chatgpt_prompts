import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';

class PromptDetailsInitialParams {
  const PromptDetailsInitialParams({
    this.prompt = const Prompt.empty(),
  });

  final Prompt prompt;
}
