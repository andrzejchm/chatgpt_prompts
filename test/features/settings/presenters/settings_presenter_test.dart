import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/settings/settings_initial_params.dart';
import 'package:chatgpt_prompts/features/settings/settings_presentation_model.dart';
import 'package:chatgpt_prompts/features/settings/settings_presenter.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/settings_mock_definitions.dart';

void main() {
  late SettingsPresentationModel model;
  late SettingsPresenter presenter;
  late MockSettingsNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = SettingsPresentationModel.initial(const SettingsInitialParams());
    navigator = MockSettingsNavigator();
    presenter = SettingsPresenter(
      model,
      navigator,
    );
  });
}
