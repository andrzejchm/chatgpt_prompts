import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/create_chat_completion_failure.dart';
import 'package:chatgpt_prompts/core/domain/repositories/openai_repository.dart';
import 'package:dart_openai/openai.dart';
import 'package:dartz/dartz.dart';

typedef CreateChatCompletionResult = Either<CreateChatCompletionFailure, OpenAIChatCompletionModel>;

class CreateChatCompletionUseCase {
  const CreateChatCompletionUseCase(
    this._openaiRepository,
  );

  final OpenaiRepository _openaiRepository;

  //TODO return domain entity model
  Future<CreateChatCompletionResult> execute({
    required List<ChatCompletionMessageInput> inputs,
  }) async {
    return _openaiRepository.createChatCompletion(inputs: inputs);
  }
}
