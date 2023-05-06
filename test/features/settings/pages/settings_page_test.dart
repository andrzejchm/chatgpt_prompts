import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/settings/settings_initial_params.dart';
import 'package:chatgpt_prompts/features/settings/settings_navigator.dart';
import 'package:chatgpt_prompts/features/settings/settings_page.dart';
import 'package:chatgpt_prompts/features/settings/settings_presentation_model.dart';
import 'package:chatgpt_prompts/features/settings/settings_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';

Future<void> main() async {
  late SettingsPage page;
  late SettingsInitialParams initParams;
  late SettingsPresentationModel model;
  late SettingsPresenter presenter;
  late SettingsNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  void initMvp() {
    initParams = const SettingsInitialParams();
    model = SettingsPresentationModel.initial(
      initParams,
    );
    navigator = SettingsNavigator(Mocks.appNavigator);
    presenter = SettingsPresenter(
      model,
      navigator,
    );
    page = SettingsPage(presenter: presenter);
  }

  await screenshotTest(
    'settings_page',
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test('getIt page resolves successfully', () async {
    initMvp();
    final page = getIt<SettingsPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
