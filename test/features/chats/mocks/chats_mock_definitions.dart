import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/features/chats/chat/chat_initial_params.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_navigator.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presentation_model.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presenter.dart';

//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

// MVP

class MockChatNavigator extends Mock implements ChatNavigator {}

class MockChatPresentationModel extends Mock implements ChatPresentationModel {}

class MockChatPresenter extends MockCubit<ChatViewModel> implements ChatPresenter {}

class MockChatInitialParams extends Mock implements ChatInitialParams {}
//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES
//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
//DO-NOT-REMOVE STORES_MOCK_DEFINITION
