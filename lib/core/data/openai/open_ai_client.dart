import 'package:chatgpt_prompts/core/data/openai/model/openai_chat_completion_transformers.dart';
import 'package:chatgpt_prompts/core/domain/providers/config_provider.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:dart_openai/openai.dart';

class OpenAIClient {
  const OpenAIClient(this._configProvider);

  static const defaultMaxTokens = 2048;
  static const defaultChatModel = 'gpt-3.5-turbo';

  final ConfigProvider _configProvider;

  Stream<CompletionStreamedChunk> executePrompt({
    required PromptExecutionRequest request,
  }) async* {
    OpenAI.apiKey = (await _configProvider.getConfig()).openApiKey;

    const model = defaultChatModel;
    yield* OpenAI.instance.chat.createStream(
      model: model,
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: request.compileTemplate(),
        ),
      ],
    ).handleError((error, stack) {
      logError(error, stack);
      throw error as Object;
    }).map((event) {
      return event.toChatCompletionResult(model);
    });
  }
}
