import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/get_prompt_execution_form_data_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:dartz/dartz.dart';

typedef GetPromptExecutionFormDataResult = Either<GetPromptExecutionFormDataFailure, PromptExecutionFormData>;

class GetPromptExecutionFormDataUseCase {
  const GetPromptExecutionFormDataUseCase(
    this._promptsRepository,
  );

  final PromptsRepository _promptsRepository;

  Future<GetPromptExecutionFormDataResult> execute({
    required Id promptId,
  }) async {
    return _promptsRepository.getPromptExecutionFormData(
      promptId: promptId,
    );
  }
}
