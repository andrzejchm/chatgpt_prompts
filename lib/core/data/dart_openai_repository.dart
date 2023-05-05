import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_role.dart';
import 'package:chatgpt_prompts/core/domain/model/create_chat_completion_failure.dart';
import 'package:chatgpt_prompts/core/domain/providers/config_provider.dart';
import 'package:chatgpt_prompts/core/domain/repositories/openai_repository.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:dart_openai/openai.dart';
import 'package:dartz/dartz.dart';

class DartOpenaiRepository implements OpenaiRepository {
  const DartOpenaiRepository(
    this.configProvider,
  );

  static const openAiModel = 'gpt-3.5-turbo';
  final ConfigProvider configProvider;

  @override
  Future<Either<CreateChatCompletionFailure, OpenAIChatCompletionModel>> createChatCompletion({
    required List<ChatCompletionMessageInput> inputs,
  }) async {
    try {
      OpenAI.apiKey = (await configProvider.getConfig()).openApiKey;
      final response = await OpenAI.instance.chat.create(
        model: openAiModel,
        messages: inputs.map((e) => e.toMessageModel()).toList(),
      );
      return success(response);
    } catch (ex, stack) {
      logError(ex, stack);
      return failure(CreateChatCompletionFailure.unknown(ex));
    }
  }
}

//extension on chatCompletionMessageInput to create instances of   OpenAIChatCompletionChoiceMessageModel
extension ChatCompletionMessageInputX on ChatCompletionMessageInput {
  OpenAIChatCompletionChoiceMessageModel toMessageModel() {
    return OpenAIChatCompletionChoiceMessageModel(
      content: message,
      role: role.toRole(),
    );
  }
}

//extension to create OpenAIChatMessageRole from ChatCompletionRole
extension ChatCompletionRoleX on ChatCompletionRole {
  OpenAIChatMessageRole toRole() {
    switch (this) {
      case ChatCompletionRole.system:
        return OpenAIChatMessageRole.system;
      case ChatCompletionRole.user:
        return OpenAIChatMessageRole.user;
      case ChatCompletionRole.assistant:
        return OpenAIChatMessageRole.assistant;
    }
  }
}
