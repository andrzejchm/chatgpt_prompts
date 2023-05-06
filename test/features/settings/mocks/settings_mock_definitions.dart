import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/features/settings/settings_initial_params.dart';
import 'package:chatgpt_prompts/features/settings/settings_navigator.dart';
import 'package:chatgpt_prompts/features/settings/settings_presentation_model.dart';
import 'package:chatgpt_prompts/features/settings/settings_presenter.dart';

//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

// MVP

class MockSettingsPresenter extends MockCubit<SettingsViewModel> implements SettingsPresenter {}

class MockSettingsPresentationModel extends Mock implements SettingsPresentationModel {}

class MockSettingsInitialParams extends Mock implements SettingsInitialParams {}

class MockSettingsNavigator extends Mock implements SettingsNavigator {}

//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES
//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
//DO-NOT-REMOVE STORES_MOCK_DEFINITION
