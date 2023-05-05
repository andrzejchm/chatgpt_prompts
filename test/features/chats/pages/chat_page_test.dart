import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_initial_params.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_navigator.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_page.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presentation_model.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../test_utils/golden_tests_utils.dart';
import '../../../test_utils/test_utils.dart';

Future<void> main() async {
  late ChatPage page;
  late ChatInitialParams initParams;
  late ChatPresentationModel model;
  late ChatPresenter presenter;
  late ChatNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  void initMvp() {
    initParams = const ChatInitialParams();
    model = ChatPresentationModel.initial(
      initParams,
    );
    navigator = ChatNavigator(Mocks.appNavigator);
    presenter = ChatPresenter(
      model,
      navigator,
      Mocks.createChatCompletionUseCase,
    );
    page = ChatPage(presenter: presenter);
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
    final page = getIt<ChatPage>(param1: initParams);
    expect(page.presenter, isNotNull);
    expect(page, isNotNull);
  });
}
