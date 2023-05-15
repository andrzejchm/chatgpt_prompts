import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/data/openai_prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';
import '../mocks/mocks.dart';
import '../mocks/stubs.dart';
import 'fakes/fake_hive_client.dart';
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
      getIt.registerSingleton<PromptsRepository>(
        OpenaiPromptsRepository(
          FakeHiveClient(),
          Mocks.openAIClient,
        ),
      );
      OpenaiPromptsRepository.prompts = Stubs.promptsList;

      promptsPresenter = getIt<PromptsPresenter>(param1: const PromptsInitialParams());
    },
  );

  tearDown(
    () => Hive.deleteFromDisk(),
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

      final prompt0ListItem = promptsRobot.promptListItemWithName('Prompt 0');
      final prompt1ListItem = promptsRobot.promptListItemWithName('Prompt 1');

      await prompt0ListItem.waitUntilVisible();
      await prompt0ListItem.tap();
      await promptDetailsRobot.promptName.hasDisplayedText('Prompt 0');

      await prompt1ListItem.tap();
      await promptDetailsRobot.promptName.hasDisplayedText('Prompt 1');
    },
  );

  uiTest(
    'selecting prompt in list should load prompt execution data from storage',
    createPage: () => PromptsPage(presenter: getIt<PromptsPresenter>(param1: const PromptsInitialParams())),
    prepare: (tester) {
      promptsRobot = PromptsRobot(tester);
      promptDetailsRobot = PromptDetailsRobot(tester);
    },
    test: (tester) async {
      final prompt0ListItem = promptsRobot.promptListItemWithName('Prompt 0');
      final prompt1ListItem = promptsRobot.promptListItemWithName('Prompt 1');
      final formatVariable = promptDetailsRobot.variableTextField('format');
      final greetingVariable = promptDetailsRobot.variableTextField('greeting');

      await prompt0ListItem.waitUntilVisible();
      await prompt0ListItem.tap();

      await formatVariable.typeText('json');
      await formatVariable.hasInputText('json');

      await prompt1ListItem.tap();
      await greetingVariable.typeText('Hello');
      await greetingVariable.hasInputText('Hello');

      await prompt0ListItem.tap();
      await formatVariable.hasInputText('json');
      await greetingVariable.hasInputText('');

      await prompt1ListItem.tap();
      await formatVariable.hasInputText('');
      await greetingVariable.hasInputText('Hello');

      await tester.pumpAndSettle();
    },
  );
}
