import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/chats/chat/chat_initial_params.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presentation_model.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presenter.dart';
import '../../../mocks/mocks.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/chats_mock_definitions.dart';

void main() {
  late ChatPresentationModel model;
  late ChatPresenter presenter;
  late MockChatNavigator navigator;

  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
    () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = ChatPresentationModel.initial(const ChatInitialParams());
    navigator = MockChatNavigator();
    presenter = ChatPresenter(
      model,
      navigator,
      Mocks.createChatCompletionUseCase,
    );
  });
}
