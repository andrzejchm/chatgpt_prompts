import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';
import '../features/prompts/mocks/prompts_mocks.dart';
import '../mocks/stubs.dart';
import '../test_utils/test_utils.dart';
import 'robots/prompt_details_robot.dart';
import 'robots/prompts_robot.dart';
import 'utils/ui_test_utils.dart';

void main() {
  late PromptsPresenter promptsPresenter;
  late PromptsRobot promptsRobot;
  late PromptDetailsRobot promptDetailsRobot;

  setUp(
    () async {
      await prepareIntegrationTests();
      getIt.registerSingleton<PromptsRepository>(PromptsMocks.promptsRepository);
      when(() => PromptsMocks.promptsRepository.getPromptsList())
          .thenAnswer((_) async => successFuture(Stubs.promptsList));
      Mock.throwOnMissingStub();
      promptsPresenter = getIt<PromptsPresenter>(param1: const PromptsInitialParams());
    },
  );

  uiTest(
    'selecting prompt in list should show prompt details',
    createPage: () => PromptsPage(presenter: promptsPresenter),
    prepare: (tester) {
      promptsRobot = PromptsRobot(tester);
      promptDetailsRobot = PromptDetailsRobot(tester);
    },
    test: (tester) async {
      promptsRobot.verifyPageVisible();
      promptDetailsRobot.verifyPageVisible();

      await promptsRobot.promptListItemWithName('Prompt 0').tap();
      await promptDetailsRobot.title.hasText('Prompt 0');

      await promptsRobot.promptListItemWithName('Prompt 1').tap();
      await promptDetailsRobot.title.hasText('Prompt 1');
    },
  );
}
