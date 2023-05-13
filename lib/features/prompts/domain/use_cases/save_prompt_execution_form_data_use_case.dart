import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/save_prompt_execution_form_data_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:dartz/dartz.dart';

typedef SavePromptExecutionFormDataResult = Either<SavePromptExecutionFormDataFailure, Unit>;

class SavePromptExecutionFormDataUseCase {
  const SavePromptExecutionFormDataUseCase(
    this._promptsRepository,
  );

  final PromptsRepository _promptsRepository;

  Future<SavePromptExecutionFormDataResult> execute({
    required Id promptId,
    required PromptExecutionFormData formData,
  }) async {
    return _promptsRepository.savePromptExecutionFormData(
      formData: formData,
      promptId: promptId,
    );
  }
}
