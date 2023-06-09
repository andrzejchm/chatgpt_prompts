import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_initial_params.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presenter.dart';
import 'package:chatgpt_prompts/features/main/main_initial_params.dart';
import 'package:chatgpt_prompts/features/main/main_navigator.dart';
import 'package:chatgpt_prompts/features/main/main_page.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:chatgpt_prompts/features/main/main_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';
import 'package:chatgpt_prompts/features/settings/settings_initial_params.dart';
import 'package:chatgpt_prompts/features/settings/settings_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';
import '../../prompts/mocks/prompts_mocks.dart';

Future<void> main() async {
  late MainPage page;
  late MainInitialParams initParams;
  late MainPresentationModel model;
  late MainPresenter presenter;
  late MainNavigator navigator;

  setUp(() {
    prepareAppForUnitTests();
    getIt.registerSingleton<PromptsRepository>(PromptsMocks.promptsRepository);
    when(() => PromptsMocks.promptsRepository.getPromptsList()).thenAnswer(
      (_) async => successFuture([]),
    );
    when(() => Mocks.getLocalPreferencesUseCase.execute()) //
        .thenAnswer((_) async => success(Stubs.localPreferences));
  });

  void initMvp() {
    initParams = const MainInitialParams();
    model = MainPresentationModel.initial(
      initParams,
      getIt<ChatPresenter>(param1: const ChatInitialParams()),
      getIt<SettingsPresenter>(param1: const SettingsInitialParams()),
      getIt<PromptsPresenter>(param1: const PromptsInitialParams()),
    );
    navigator = MainNavigator(Mocks.appNavigator);
    presenter = MainPresenter(
      model,
      navigator,
      Mocks.getLocalPreferencesUseCase,
      Mocks.saveLocalPreferencesUseCase,
    );
    page = MainPage(presenter: presenter);
  }

  await screenshotTest(
    'main_page',
    setUp: () async {
      initMvp();
    },
    pageBuilder: () => page,
  );

  test('getIt page resolves successfully', () async {
    initMvp();
    final page = getIt<MainPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
