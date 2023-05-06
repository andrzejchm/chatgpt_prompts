import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/main/main_initial_params.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:chatgpt_prompts/features/main/main_presenter.dart';
import '../../../test_utils/test_utils.dart';
import '../../chats/mocks/chats_mock_definitions.dart';
import '../../prompts/mocks/prompts_mock_definitions.dart';
import '../../settings/mocks/settings_mock_definitions.dart';
import '../mocks/main_mock_definitions.dart';

void main() {
  late MainPresentationModel model;
  late MainPresenter presenter;
  late MockMainNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
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
    );
  });
}
