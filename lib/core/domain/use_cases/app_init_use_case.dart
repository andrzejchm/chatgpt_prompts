import 'package:dartz/dartz.dart';
import 'package:chatgpt_prompts/core/domain/model/app_init_failure.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';

/// Takes care of the entire app initialization, populating stores with values, setting up the state the entire app
class AppInitUseCase {
  const AppInitUseCase();

  Future<Either<AppInitFailure, Unit>> execute() async {
    // TODO add app initialization code here, like loading user data from local storage etc.
    return success(unit);
  }
}
