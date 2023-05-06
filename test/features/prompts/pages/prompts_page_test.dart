import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';

Future<void> main() async {
  late PromptsPage page;
  late PromptsInitialParams initParams;
  late PromptsPresentationModel model;
  late PromptsPresenter presenter;
  late PromptsNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  void initMvp() {
    initParams = const PromptsInitialParams();
    model = PromptsPresentationModel.initial(
      initParams,
      getIt<PromptsListPresenter>(param1: const PromptsListInitialParams()),
    );
    navigator = PromptsNavigator(Mocks.appNavigator);
    presenter = PromptsPresenter(
      model,
      navigator,
    );
    page = PromptsPage(presenter: presenter);
  }

  await screenshotTest(
    'prompts_page',
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test('getIt page resolves successfully', () async {
    initMvp();
    final page = getIt<PromptsPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
