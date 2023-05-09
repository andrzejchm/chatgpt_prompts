import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';

abstract class PromptsRepository {
  Future<GetPromptsListResult> getPromptsList();

  Stream<ExecutePromptResult> executePrompt({required PromptExecutionRequest request});
}
