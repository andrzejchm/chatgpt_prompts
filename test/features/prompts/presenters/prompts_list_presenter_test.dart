import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mock_definitions.dart';
import '../mocks/prompts_mocks.dart';

void main() {
  late PromptsListPresentationModel model;
  late PromptsListPresenter presenter;
  late MockPromptsListNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = PromptsListPresentationModel.initial(const PromptsListInitialParams());
    navigator = MockPromptsListNavigator();
    presenter = PromptsListPresenter(
      model,
      navigator,
      PromptsMocks.getPromptsListUseCase,
    );
  });
}
