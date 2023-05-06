import 'package:chatgpt_prompts/features/prompts/domain/model/get_prompts_list_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:dartz/dartz.dart';

typedef GetPromptsListResult = Either<GetPromptsListFailure, List<Prompt>>;

class GetPromptsListUseCase {
  const GetPromptsListUseCase(
    this._promptsRepository,
  );

  final PromptsRepository _promptsRepository;

  Future<GetPromptsListResult> execute() async {
    return _promptsRepository.getPromptsList();
  }
}
