import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/create_chat_completion_failure.dart';
import 'package:dart_openai/openai.dart';
import 'package:dartz/dartz.dart';

abstract class OpenaiRepository {
  Future<Either<CreateChatCompletionFailure, OpenAIChatCompletionModel>> createChatCompletion({
    required List<ChatCompletionMessageInput> inputs,
  });
}
