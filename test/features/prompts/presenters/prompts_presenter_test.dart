import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mock_definitions.dart';

void main() {
  late PromptsPresentationModel model;
  late PromptsPresenter presenter;
  late MockPromptsNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = PromptsPresentationModel.initial(
      const PromptsInitialParams(),
      MockPromptsListPresenter(),
      MockPromptDetailsPresenter(),
    );
    navigator = MockPromptsNavigator();
    presenter = PromptsPresenter(
      model,
      navigator,
    );
  });
}
