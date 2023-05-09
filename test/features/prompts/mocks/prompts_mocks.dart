import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'prompts_mock_definitions.dart';

//DO-NOT-REMOVE IMPORTS_MOCKS

class PromptsMocks {
  // MVP

  static late MockPromptsPresenter promptsPresenter;
  static late MockPromptsPresentationModel promptsPresentationModel;
  static late MockPromptsInitialParams promptsInitialParams;
  static late MockPromptsNavigator promptsNavigator;

  static late MockPromptsListPresenter promptsListPresenter;
  static late MockPromptsListPresentationModel promptsListPresentationModel;
  static late MockPromptsListInitialParams promptsListInitialParams;
  static late MockPromptsListNavigator promptsListNavigator;

  static late MockEditPromptPresenter editPromptPresenter;
  static late MockEditPromptPresentationModel editPromptPresentationModel;
  static late MockEditPromptInitialParams editPromptInitialParams;
  static late MockEditPromptNavigator editPromptNavigator;

  static late MockPromptDetailsPresenter promptDetailsPresenter;
  static late MockPromptDetailsPresentationModel promptDetailsPresentationModel;
  static late MockPromptDetailsInitialParams promptDetailsInitialParams;
  static late MockPromptDetailsNavigator promptDetailsNavigator;

  static late MockPromptExecutionPresenter promptExecutionPresenter;
  static late MockPromptExecutionPresentationModel promptExecutionPresentationModel;
  static late MockPromptExecutionInitialParams promptExecutionInitialParams;
  static late MockPromptExecutionNavigator promptExecutionNavigator;

//DO-NOT-REMOVE MVP_MOCKS_STATIC_FIELD

  // USE CASES

  static late MockGetPromptsListFailure getPromptsListFailure;
  static late MockGetPromptsListUseCase getPromptsListUseCase;

  static late MockExecutePromptFailure executePromptFailure;
  static late MockExecutePromptUseCase executePromptUseCase;

//DO-NOT-REMOVE USE_CASE_MOCKS_STATIC_FIELD

  // REPOSITORIES
  static late MockPromptsRepository promptsRepository;

//DO-NOT-REMOVE REPOSITORIES_MOCKS_STATIC_FIELD

  // STORES

  //DO-NOT-REMOVE STORES_MOCKS_STATIC_FIELD

  static void init() {
    _initMocks();
    _initFallbacks();
  }

  static void _initMocks() {
    //DO-NOT-REMOVE FEATURES_MOCKS
    // MVP
    promptsPresenter = MockPromptsPresenter();
    promptsPresentationModel = MockPromptsPresentationModel();
    promptsInitialParams = MockPromptsInitialParams();
    promptsNavigator = MockPromptsNavigator();

    promptsListPresenter = MockPromptsListPresenter();
    promptsListPresentationModel = MockPromptsListPresentationModel();
    promptsListInitialParams = MockPromptsListInitialParams();
    promptsListNavigator = MockPromptsListNavigator();

    editPromptPresenter = MockEditPromptPresenter();
    editPromptPresentationModel = MockEditPromptPresentationModel();
    editPromptInitialParams = MockEditPromptInitialParams();
    editPromptNavigator = MockEditPromptNavigator();

    promptDetailsPresenter = MockPromptDetailsPresenter();
    promptDetailsPresentationModel = MockPromptDetailsPresentationModel();
    promptDetailsInitialParams = MockPromptDetailsInitialParams();
    promptDetailsNavigator = MockPromptDetailsNavigator();

    promptExecutionPresenter = MockPromptExecutionPresenter();
    promptExecutionPresentationModel = MockPromptExecutionPresentationModel();
    promptExecutionInitialParams = MockPromptExecutionInitialParams();
    promptExecutionNavigator = MockPromptExecutionNavigator();

//DO-NOT-REMOVE MVP_INIT_MOCKS

    // USE CASES
    getPromptsListFailure = MockGetPromptsListFailure();
    getPromptsListUseCase = MockGetPromptsListUseCase();

    executePromptFailure = MockExecutePromptFailure();
    executePromptUseCase = MockExecutePromptUseCase();

//DO-NOT-REMOVE USE_CASE_INIT_MOCKS

    // REPOSITORIES
    promptsRepository = MockPromptsRepository();
    promptsRepository = MockPromptsRepository();
//DO-NOT-REMOVE REPOSITORIES_INIT_MOCKS

    // STORES
    //DO-NOT-REMOVE STORES_INIT_MOCKS
  }

  static void _initFallbacks() {
    //DO-NOT-REMOVE FEATURES_FALLBACKS
    // MVP
    registerFallbackValue(MockPromptsPresenter());
    registerFallbackValue(MockPromptsPresentationModel());
    registerFallbackValue(MockPromptsInitialParams());
    registerFallbackValue(MockPromptsNavigator());

    registerFallbackValue(MockPromptsListPresenter());
    registerFallbackValue(MockPromptsListPresentationModel());
    registerFallbackValue(MockPromptsListInitialParams());
    registerFallbackValue(MockPromptsListNavigator());

    registerFallbackValue(MockEditPromptPresenter());
    registerFallbackValue(MockEditPromptPresentationModel());
    registerFallbackValue(MockEditPromptInitialParams());
    registerFallbackValue(MockEditPromptNavigator());

    registerFallbackValue(MockPromptDetailsPresenter());
    registerFallbackValue(MockPromptDetailsPresentationModel());
    registerFallbackValue(MockPromptDetailsInitialParams());
    registerFallbackValue(MockPromptDetailsNavigator());

    registerFallbackValue(MockPromptExecutionPresenter());
    registerFallbackValue(MockPromptExecutionPresentationModel());
    registerFallbackValue(MockPromptExecutionInitialParams());
    registerFallbackValue(MockPromptExecutionNavigator());

//DO-NOT-REMOVE MVP_MOCK_FALLBACK_VALUE

    // USE CASES
    registerFallbackValue(MockGetPromptsListFailure());
    registerFallbackValue(MockGetPromptsListUseCase());

    registerFallbackValue(MockExecutePromptFailure());
    registerFallbackValue(MockExecutePromptUseCase());

//DO-NOT-REMOVE USE_CASE_MOCK_FALLBACK_VALUE

    // REPOSITORIES
    registerFallbackValue(MockPromptsRepository());
    registerFallbackValue(MockPromptsRepository());
//DO-NOT-REMOVE REPOSITORIES_MOCK_FALLBACK_VALUE

    // STORES
    //DO-NOT-REMOVE STORES_MOCK_FALLBACK_VALUE
    registerFallbackValue(const PromptExecutionRequest.empty());
  }
}
