import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';

Future<void> main() async {
  late PromptsListPage page;
  late PromptsListInitialParams initParams;
  late PromptsListPresentationModel model;
  late PromptsListPresenter presenter;
  late PromptsListNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  void initMvp() {
    initParams = const PromptsListInitialParams();
    model = PromptsListPresentationModel.initial(
      initParams,
    );
    navigator = PromptsListNavigator(Mocks.appNavigator);
    presenter = PromptsListPresenter(
      model,
      navigator,
    );
    page = PromptsListPage(presenter: presenter);
  }

  await screenshotTest(
    'prompts_list_page',
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test('getIt page resolves successfully', () async {
    initMvp();
    final page = getIt<PromptsListPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
