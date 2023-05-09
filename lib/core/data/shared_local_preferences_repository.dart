import 'package:chatgpt_prompts/core/domain/model/get_local_preferences_failure.dart';
import 'package:chatgpt_prompts/core/domain/model/local_preferences.dart';
import 'package:chatgpt_prompts/core/domain/model/main_tab.dart';
import 'package:chatgpt_prompts/core/domain/model/save_local_preferences_failure.dart';
import 'package:chatgpt_prompts/core/domain/repositories/local_preferences_repository.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/get_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/save_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalPreferencesRepository implements LocalPreferencesRepository {
  const SharedLocalPreferencesRepository();

  static String get keyMainTab => 'mainTab';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  @override
  Future<GetLocalPreferencesResult> getLocalPreferences() async {
    try {
      final prefs = await _prefs;
      return success(
        //remember to also update saving when adding new fields
        LocalPreferences(
          mainTab: MainTab.fromString(prefs.getString(keyMainTab) ?? ''),
        ),
      );
    } catch (ex, stack) {
      logError(ex, stack);
      return failure(GetLocalPreferencesFailure.unknown(ex));
    }
  }

  @override
  Future<SaveLocalPreferencesResult> saveLocalPreferences(LocalPreferences localPreferences) async {
    try {
      final prefs = await _prefs;
      await prefs.setString(
        keyMainTab,
        localPreferences.mainTab.stringVal,
      );
      return success(unit);
    } catch (ex, stack) {
      logError(ex, stack);
      return failure(SaveLocalPreferencesFailure.unknown(ex));
    }
  }
}
