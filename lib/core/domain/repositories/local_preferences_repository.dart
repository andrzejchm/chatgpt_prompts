import 'package:chatgpt_prompts/core/domain/model/local_preferences.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/get_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/save_local_preferences_use_case.dart';

abstract class LocalPreferencesRepository {
  Future<GetLocalPreferencesResult> getLocalPreferences();

  Future<SaveLocalPreferencesResult> saveLocalPreferences(
    LocalPreferences localPreferences,
  );
}
