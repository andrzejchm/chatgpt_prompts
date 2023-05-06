import 'package:dartz/dartz.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/get_prompts_list_failure.dart';

class GetPromptsListUseCase {
  const GetPromptsListUseCase();

  Future<Either<GetPromptsListFailure, Unit>> execute() async {
    return failure(const GetPromptsListFailure.unknown());
  }
}
