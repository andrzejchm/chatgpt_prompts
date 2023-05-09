import 'package:chatgpt_prompts/core/domain/model/local_preferences.dart';
import 'package:chatgpt_prompts/core/domain/model/save_local_preferences_failure.dart';
import 'package:chatgpt_prompts/core/domain/repositories/local_preferences_repository.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:dartz/dartz.dart';

typedef SaveLocalPreferencesResult = Either<SaveLocalPreferencesFailure, Unit>;
typedef PrefsUpdater = LocalPreferences Function(LocalPreferences prefs);

class SaveLocalPreferencesUseCase {
  const SaveLocalPreferencesUseCase(
    this._localPreferencesRepository,
  );

  final LocalPreferencesRepository _localPreferencesRepository;

  Future<SaveLocalPreferencesResult> execute({
    required PrefsUpdater prefsUpdater,
  }) async {
    return _localPreferencesRepository
        .getLocalPreferences() //
        .mapFailure((fail) {
      return SaveLocalPreferencesFailure.unknown(fail);
    }).flatMap(
      (it) {
        final updatedPrefs = prefsUpdater(it);
        return _localPreferencesRepository.saveLocalPreferences(updatedPrefs);
      },
    );
  }
}
