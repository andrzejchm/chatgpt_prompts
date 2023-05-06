import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';

Future<void> main() async {
  late PromptDetailsPage page;
  late PromptDetailsInitialParams initParams;
  late PromptDetailsPresentationModel model;
  late PromptDetailsPresenter presenter;
  late PromptDetailsNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  void initMvp() {
    initParams = const PromptDetailsInitialParams();
    model = PromptDetailsPresentationModel.initial(
      initParams,
    );
    navigator = PromptDetailsNavigator(Mocks.appNavigator);
    presenter = PromptDetailsPresenter(
      model,
      navigator,
    );
    page = PromptDetailsPage(presenter: presenter);
  }

  await screenshotTest(
    'prompt_details_page',
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test('getIt page resolves successfully', () async {
    initMvp();
    final page = getIt<PromptDetailsPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
