import 'package:chatgpt_prompts/features/settings/settings_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class SettingsPresentationModel implements SettingsViewModel {
  /// Creates the initial state
  SettingsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    SettingsInitialParams initialParams,
  );

  /// Used for the copyWith method
  SettingsPresentationModel._();

  SettingsPresentationModel copyWith() {
    return SettingsPresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class SettingsViewModel {}
