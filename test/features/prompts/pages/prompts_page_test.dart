import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mocks.dart';

Future<void> main() async {
  late PromptsPage page;
  late PromptsInitialParams initParams;
  late PromptsPresentationModel model;
  late PromptsPresenter presenter;
  late PromptsNavigator navigator;

  setUp(() {
    prepareAppForUnitTests();
    getIt.registerSingleton<PromptsRepository>(PromptsMocks.promptsRepository);
    when(() => PromptsMocks.promptsRepository.getPromptsList()).thenAnswer(
      (_) async => successFuture(Stubs.promptsList),
    );
    when(
      () => PromptsMocks.promptsRepository.getPromptExecutionFormData(
        promptId: any(named: 'promptId'),
      ),
    ).thenAnswer((_) async => right(Stubs.promptExecutionFormData));
  });

  void initMvp() {
    initParams = const PromptsInitialParams();
    model = PromptsPresentationModel.initial(
      initParams,
      getIt<PromptsListPresenter>(param1: const PromptsListInitialParams()),
      getIt<PromptDetailsPresenter>(param1: const PromptDetailsInitialParams()),
      getIt<PromptExecutionPresenter>(param1: const PromptExecutionInitialParams()),
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
    devices: [Device.tabletLandscape],
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
