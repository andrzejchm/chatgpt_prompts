import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/domain/model/local_preferences.dart';
import 'package:chatgpt_prompts/core/domain/model/main_tab.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/save_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/main/main_initial_params.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:chatgpt_prompts/features/main/main_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';
import '../../chats/mocks/chats_mock_definitions.dart';
import '../../prompts/mocks/prompts_mock_definitions.dart';
import '../../settings/mocks/settings_mock_definitions.dart';
import '../mocks/main_mock_definitions.dart';

void main() {
  late MainPresentationModel model;
  late MainPresenter presenter;
  late MockMainNavigator navigator;

  setUp(() {
    prepareAppForUnitTests();
    when(() => Mocks.getLocalPreferencesUseCase.execute()) //
        .thenAnswer((_) async => success(Stubs.localPreferences));
    when(() => Mocks.saveLocalPreferencesUseCase.execute(prefsUpdater: any(named: 'prefsUpdater')))
        .thenAnswer((_) async => success(unit));
  });

  test(
    'onInit should retrieve current tab from local prefs',
    () {
      presenter.onInit();

      verify(() => Mocks.getLocalPreferencesUseCase.execute());
      expect(
        presenter.state.selectedTab,
        Stubs.localPreferences.mainTab,
      );
    },
  );

  test(
    'selecting tab should save it to localPreferences',
    () async {
      late LocalPreferences savedConfig;
      when(() => Mocks.saveLocalPreferencesUseCase.execute(prefsUpdater: any(named: 'prefsUpdater'))).thenAnswer(
        (invocation) async {
          final callback = invocation.namedArguments[#prefsUpdater] as PrefsUpdater;
          savedConfig = callback(Stubs.localPreferences);
          return success(unit);
        },
      );
      final promptsIndex = presenter.state.tabs.indexOf(MainTab.prompts);
      await presenter.onTabSelected(promptsIndex);

      verify(
        () => Mocks.saveLocalPreferencesUseCase.execute(
          prefsUpdater: captureAny(named: 'prefsUpdater'),
        ),
      );
      expect(
        presenter.state.selectedTab,
        savedConfig.mainTab,
      );
      expect(
        presenter.state.selectedTab,
        MainTab.prompts,
      );
    },
  );

  setUp(() {
    model = MainPresentationModel.initial(
      const MainInitialParams(),
      MockChatPresenter(),
      MockSettingsPresenter(),
      MockPromptsPresenter(),
    );
    navigator = MockMainNavigator();
    presenter = MainPresenter(
      model,
      navigator,
      Mocks.getLocalPreferencesUseCase,
      Mocks.saveLocalPreferencesUseCase,
    );
  });
}
