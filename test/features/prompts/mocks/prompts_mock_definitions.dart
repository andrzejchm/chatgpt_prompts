import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/features/prompts/domain/model/execute_prompt_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/get_prompts_list_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presenter.dart';
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

class MockEditPromptPresenter extends MockCubit<EditPromptViewModel> implements EditPromptPresenter {}

class MockEditPromptPresentationModel extends Mock implements EditPromptPresentationModel {}

class MockEditPromptInitialParams extends Mock implements EditPromptInitialParams {}

class MockEditPromptNavigator extends Mock implements EditPromptNavigator {}

class MockPromptDetailsPresenter extends MockCubit<PromptDetailsViewModel> implements PromptDetailsPresenter {}

class MockPromptDetailsPresentationModel extends Mock implements PromptDetailsPresentationModel {}

class MockPromptDetailsInitialParams extends Mock implements PromptDetailsInitialParams {}

class MockPromptDetailsNavigator extends Mock implements PromptDetailsNavigator {}

class MockPromptExecutionPresenter extends MockCubit<PromptExecutionViewModel> implements PromptExecutionPresenter {}

class MockPromptExecutionPresentationModel extends Mock implements PromptExecutionPresentationModel {}

class MockPromptExecutionInitialParams extends Mock implements PromptExecutionInitialParams {}

class MockPromptExecutionNavigator extends Mock implements PromptExecutionNavigator {}

//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES
class MockGetPromptsListFailure extends Mock implements GetPromptsListFailure {}

class MockGetPromptsListUseCase extends Mock implements GetPromptsListUseCase {}

class MockExecutePromptFailure extends Mock implements ExecutePromptFailure {}

class MockExecutePromptUseCase extends Mock implements ExecutePromptUseCase {}

//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES
class MockPromptsRepository extends Mock implements PromptsRepository {}
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
//DO-NOT-REMOVE STORES_MOCK_DEFINITION
