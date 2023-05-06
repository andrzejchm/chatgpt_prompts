import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';

abstract class PromptsRepository {
  Future<GetPromptsListResult> getPromptsList();
}
