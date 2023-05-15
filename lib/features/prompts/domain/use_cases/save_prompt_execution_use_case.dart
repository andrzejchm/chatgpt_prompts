import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/save_prompt_execution_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:dartz/dartz.dart';

typedef SavePromptExecutionResult = Either<SavePromptExecutionFailure, Unit>;

class SavePromptExecutionUseCase {
  const SavePromptExecutionUseCase(
    this._promptsRepository,
  );

  final PromptsRepository _promptsRepository;

  Future<SavePromptExecutionResult> execute({
    required Id promptId,
    required CompletionStreamedChunk streamedChunk,
  }) async {
    return _promptsRepository.savePromptExecution(
      promptId: promptId,
      streamedChunk: streamedChunk,
    );
  }
}
