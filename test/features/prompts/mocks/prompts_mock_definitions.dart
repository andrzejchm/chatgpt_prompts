import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';

//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

// MVP

class MockPromptsPresenter extends MockCubit<PromptsViewModel> implements PromptsPresenter {}

class MockPromptsPresentationModel extends Mock implements PromptsPresentationModel {}

class MockPromptsInitialParams extends Mock implements PromptsInitialParams {}

class MockPromptsNavigator extends Mock implements PromptsNavigator {}

//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES
//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
//DO-NOT-REMOVE STORES_MOCK_DEFINITION
