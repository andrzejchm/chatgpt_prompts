import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/execute_prompt_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:dartz/dartz.dart';

typedef ExecutePromptResult = Either<ExecutePromptFailure, CompletionStreamedChunk>;

class ExecutePromptUseCase {
  const ExecutePromptUseCase(
    this._promptsRepository,
  );

  final PromptsRepository _promptsRepository;

  Stream<ExecutePromptResult> execute({
    required PromptExecutionRequest request,
  }) {
    return _promptsRepository.executePrompt(request: request);
  }
}
