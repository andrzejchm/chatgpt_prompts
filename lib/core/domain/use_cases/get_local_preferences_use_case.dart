import 'package:chatgpt_prompts/core/domain/model/get_local_preferences_failure.dart';
import 'package:chatgpt_prompts/core/domain/model/local_preferences.dart';
import 'package:chatgpt_prompts/core/domain/repositories/local_preferences_repository.dart';
import 'package:dartz/dartz.dart';

typedef GetLocalPreferencesResult = Either<GetLocalPreferencesFailure, LocalPreferences>;

class GetLocalPreferencesUseCase {
  const GetLocalPreferencesUseCase(
    this._localPreferencesRepository,
  );

  final LocalPreferencesRepository _localPreferencesRepository;

  Future<GetLocalPreferencesResult> execute() async {
    return _localPreferencesRepository.getLocalPreferences();
  }
}
