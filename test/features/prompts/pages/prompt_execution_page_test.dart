import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mocks.dart';

Future<void> main() async {
  late PromptExecutionPage page;
  late PromptExecutionInitialParams initParams;
  late PromptExecutionPresentationModel model;
  late PromptExecutionPresenter presenter;
  late PromptExecutionNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  void initMvp() {
    initParams = const PromptExecutionInitialParams();
    model = PromptExecutionPresentationModel.initial(
      initParams,
    );
    navigator = PromptExecutionNavigator(Mocks.appNavigator);
    presenter = PromptExecutionPresenter(
      model,
      navigator,
      PromptsMocks.executePromptUseCase,
      PromptsMocks.savePromptExecutionUseCase,
      PromptsMocks.getPromptExecutionUseCase,
    );
    page = PromptExecutionPage(presenter: presenter);
  }

  await screenshotTest(
    'prompt_execution_page',
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test('getIt page resolves successfully', () async {
    initMvp();
    final page = getIt<PromptExecutionPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
