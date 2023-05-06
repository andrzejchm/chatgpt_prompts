import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presenter.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mock_definitions.dart';

void main() {
  late EditPromptPresentationModel model;
  late EditPromptPresenter presenter;
  late MockEditPromptNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = EditPromptPresentationModel.initial(const EditPromptInitialParams());
    navigator = MockEditPromptNavigator();
    presenter = EditPromptPresenter(
      model,
      navigator,
    );
  });
}
