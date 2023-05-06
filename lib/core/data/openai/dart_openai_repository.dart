import 'package:chatgpt_prompts/core/data/openai/model/openai_chat_completion_transformers.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/create_chat_completion_failure.dart';
import 'package:chatgpt_prompts/core/domain/providers/config_provider.dart';
import 'package:chatgpt_prompts/core/domain/repositories/openai_repository.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:dart_openai/openai.dart';

class DartOpenaiRepository implements OpenaiRepository {
  const DartOpenaiRepository(
    this.configProvider,
  );

  static const openAiModel = 'gpt-3.5-turbo';
  final ConfigProvider configProvider;

  @override
  Future<CreateChatCompletionResult> createChatCompletion({
    required List<ChatCompletionMessageInput> inputs,
  }) async {
    try {
      OpenAI.apiKey = (await configProvider.getConfig()).openApiKey;
      final response = await OpenAI.instance.chat.create(
        model: openAiModel,
        messages: inputs.map((e) => e.toMessageModel()).toList(),
      );
      return success(response.toChatCompletionResult());
    } catch (ex, stack) {
      logError(ex, stack);
      return failure(CreateChatCompletionFailure.unknown(ex));
    }
  }
}
