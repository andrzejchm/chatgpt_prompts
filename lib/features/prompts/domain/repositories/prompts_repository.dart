import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_form_data_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_form_data_use_case.dart';

abstract class PromptsRepository {
  Future<GetPromptsListResult> getPromptsList();

  Stream<ExecutePromptResult> executePrompt({
    required PromptExecutionRequest request,
  });

  Future<SavePromptExecutionFormDataResult> savePromptExecutionFormData({
    required Id promptId,
    required PromptExecutionFormData formData,
  });

  Future<GetPromptExecutionFormDataResult> getPromptExecutionFormData({
    required Id promptId,
  });
}
