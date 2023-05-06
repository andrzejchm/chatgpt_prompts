import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_page.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';

Future<void> main() async {
  late EditPromptPage page;
  late EditPromptInitialParams initParams;
  late EditPromptPresentationModel model;
  late EditPromptPresenter presenter;
  late EditPromptNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  void initMvp() {
    initParams = const EditPromptInitialParams();
    model = EditPromptPresentationModel.initial(
      initParams,
    );
    navigator = EditPromptNavigator(Mocks.appNavigator);
    presenter = EditPromptPresenter(
      model,
      navigator,
    );
    page = EditPromptPage(presenter: presenter);
  }

  await screenshotTest(
    'edit_prompt_page',
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test('getIt page resolves successfully', () async {
    initMvp();
    final page = getIt<EditPromptPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
