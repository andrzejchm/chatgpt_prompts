import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_result.dart';
import 'package:chatgpt_prompts/core/domain/model/create_chat_completion_failure.dart';
import 'package:chatgpt_prompts/features/chats/domain/repositories/chats_repository.dart';
import 'package:dartz/dartz.dart';

typedef CreateChatCompletionResult = Either<CreateChatCompletionFailure, ChatCompletionResult>;

class CreateChatCompletionUseCase {
  const CreateChatCompletionUseCase(
    this._chatsRepository,
  );

  final ChatsRepository _chatsRepository;

  Future<CreateChatCompletionResult> execute({
    required List<ChatCompletionMessageInput> inputs,
  }) async {
    return _chatsRepository.createChatCompletion(inputs: inputs);
  }
}
