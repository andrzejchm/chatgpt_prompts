import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mock_definitions.dart';

void main() {
  late PromptDetailsPresentationModel model;
  late PromptDetailsPresenter presenter;
  late MockPromptDetailsNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = PromptDetailsPresentationModel.initial(const PromptDetailsInitialParams());
    navigator = MockPromptDetailsNavigator();
    presenter = PromptDetailsPresenter(
      model,
      navigator,
    );
  });
}
