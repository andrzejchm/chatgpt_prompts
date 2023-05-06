import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/features/prompts/domain/model/get_prompts_list_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';

//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

// MVP

class MockPromptsPresenter extends MockCubit<PromptsViewModel> implements PromptsPresenter {}

class MockPromptsPresentationModel extends Mock implements PromptsPresentationModel {}

class MockPromptsInitialParams extends Mock implements PromptsInitialParams {}

class MockPromptsNavigator extends Mock implements PromptsNavigator {}

class MockPromptsListPresenter extends MockCubit<PromptsListViewModel> implements PromptsListPresenter {}

class MockPromptsListPresentationModel extends Mock implements PromptsListPresentationModel {}

class MockPromptsListInitialParams extends Mock implements PromptsListInitialParams {}

class MockPromptsListNavigator extends Mock implements PromptsListNavigator {}

//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES
class MockGetPromptsListFailure extends Mock implements GetPromptsListFailure {}

class MockGetPromptsListUseCase extends Mock implements GetPromptsListUseCase {}

//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES
class MockPromptsRepository extends Mock implements PromptsRepository {}
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
//DO-NOT-REMOVE STORES_MOCK_DEFINITION
