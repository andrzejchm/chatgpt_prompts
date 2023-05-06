import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';

abstract class OpenaiRepository {
  Future<CreateChatCompletionResult> createChatCompletion({
    required List<ChatCompletionMessageInput> inputs,
  });
}
