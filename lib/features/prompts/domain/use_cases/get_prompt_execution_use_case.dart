import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/get_prompt_execution_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:dartz/dartz.dart';

typedef GetPromptExecutionResult = Either<GetPromptExecutionFailure, CompletionStreamedChunk>;

class GetPromptExecutionUseCase {
  const GetPromptExecutionUseCase(
    this._promptsRepository,
  );

  final PromptsRepository _promptsRepository;

  Future<GetPromptExecutionResult> execute({
    required Id promptId,
  }) async {
    return _promptsRepository.getPromptExecution(promptId: promptId);
  }
}
