import 'package:mocktail/mocktail.dart';

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

//DO-NOT-REMOVE MVP_MOCKS_STATIC_FIELD

  // USE CASES

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

//DO-NOT-REMOVE MVP_INIT_MOCKS

    // USE CASES
    //DO-NOT-REMOVE USE_CASE_INIT_MOCKS

    // REPOSITORIES
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

//DO-NOT-REMOVE MVP_MOCK_FALLBACK_VALUE

    // USE CASES
    //DO-NOT-REMOVE USE_CASE_MOCK_FALLBACK_VALUE

    // REPOSITORIES
    registerFallbackValue(MockPromptsRepository());
//DO-NOT-REMOVE REPOSITORIES_MOCK_FALLBACK_VALUE

    // STORES
    //DO-NOT-REMOVE STORES_MOCK_FALLBACK_VALUE
  }
}
