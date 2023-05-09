import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presenter.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mock_definitions.dart';
import '../mocks/prompts_mocks.dart';

void main() {
  late PromptExecutionPresentationModel model;
  late PromptExecutionPresenter presenter;
  late MockPromptExecutionNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = PromptExecutionPresentationModel.initial(const PromptExecutionInitialParams());
    navigator = MockPromptExecutionNavigator();
    presenter = PromptExecutionPresenter(
      model,
      navigator,
      PromptsMocks.executePromptUseCase,
    );
  });
}
