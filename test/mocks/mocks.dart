import 'package:flutter/material.dart';

import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';
import 'package:chatgpt_prompts/core/domain/model/local_preferences.dart';
import 'package:chatgpt_prompts/core/utils/periodic_task_executor.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import '../features/app_init/mocks/app_init_mocks.dart';
import '../features/auth/mocks/auth_mocks.dart';
import '../features/chats/mocks/chats_mocks.dart';
import '../features/main/mocks/main_mocks.dart';
import '../features/prompts/mocks/prompts_mocks.dart';
import '../features/settings/mocks/settings_mocks.dart';
import 'mock_definitions.dart';

//DO-NOT-REMOVE IMPORTS_MOCKS

class Mocks {
  static late MockAppNavigator appNavigator;

  // MVP

  //DO-NOT-REMOVE MVP_MOCKS_STATIC_FIELD

  // USE CASES

  static late MockCreateChatCompletionFailure createChatCompletionFailure;
  static late MockCreateChatCompletionUseCase createChatCompletionUseCase;

  static late MockGetLocalPreferencesFailure getLocalPreferencesFailure;
  static late MockGetLocalPreferencesUseCase getLocalPreferencesUseCase;

  static late MockSaveLocalPreferencesFailure saveLocalPreferencesFailure;
  static late MockSaveLocalPreferencesUseCase saveLocalPreferencesUseCase;

//DO-NOT-REMOVE USE_CASE_MOCKS_STATIC_FIELD

  // REPOSITORIES
  static late MockChatsRepository chatsRepository;

  static late MockLocalPreferencesRepository localPreferencesRepository;
//DO-NOT-REMOVE REPOSITORIES_MOCKS_STATIC_FIELD

  // STORES
  static late MockUserStore userStore;

  //DO-NOT-REMOVE STORES_MOCKS_STATIC_FIELD

  static late MockDebouncer debouncer;
  static late MockPeriodicTaskExecutor periodicTaskExecutor;
  static late MockCurrentTimeProvider currentTimeProvider;

  static void init() {
    AppInitMocks.init();
    AuthMocks.init();
    ChatsMocks.init();
    MainMocks.init();
    PromptsMocks.init();
    SettingsMocks.init();
//DO-NOT-REMOVE FEATURE_MOCKS_INIT

    _initMocks();
    _initFallbacks();
  }

  static void _initMocks() {
    //DO-NOT-REMOVE FEATURES_MOCKS
    appNavigator = MockAppNavigator();
    // MVP
    //DO-NOT-REMOVE MVP_INIT_MOCKS

    // USE CASES
    createChatCompletionFailure = MockCreateChatCompletionFailure();
    createChatCompletionUseCase = MockCreateChatCompletionUseCase();

    getLocalPreferencesFailure = MockGetLocalPreferencesFailure();
    getLocalPreferencesUseCase = MockGetLocalPreferencesUseCase();

    saveLocalPreferencesFailure = MockSaveLocalPreferencesFailure();
    saveLocalPreferencesUseCase = MockSaveLocalPreferencesUseCase();

//DO-NOT-REMOVE USE_CASE_INIT_MOCKS

    // REPOSITORIES
    chatsRepository = MockChatsRepository();
    localPreferencesRepository = MockLocalPreferencesRepository();
//DO-NOT-REMOVE REPOSITORIES_INIT_MOCKS

    // STORES
    userStore = MockUserStore();
    //DO-NOT-REMOVE STORES_INIT_MOCKS

    debouncer = MockDebouncer();
    periodicTaskExecutor = MockPeriodicTaskExecutor();
    currentTimeProvider = MockCurrentTimeProvider();
  }

  static void _initFallbacks() {
    //DO-NOT-REMOVE FEATURES_FALLBACKS
    registerFallbackValue(DisplayableFailure('', title: '', message: ''));
    // MVP
    //DO-NOT-REMOVE MVP_MOCK_FALLBACK_VALUE

    // USE CASES
    registerFallbackValue(MockCreateChatCompletionFailure());
    registerFallbackValue(MockCreateChatCompletionUseCase());

    registerFallbackValue(MockGetLocalPreferencesFailure());
    registerFallbackValue(MockGetLocalPreferencesUseCase());

    registerFallbackValue(MockSaveLocalPreferencesFailure());
    registerFallbackValue(MockSaveLocalPreferencesUseCase());

//DO-NOT-REMOVE USE_CASE_MOCK_FALLBACK_VALUE

    // REPOSITORIES
    registerFallbackValue(MockChatsRepository());

    registerFallbackValue(MockLocalPreferencesRepository());
//DO-NOT-REMOVE REPOSITORIES_MOCK_FALLBACK_VALUE

    // STORES
    registerFallbackValue(MockUserStore());
    //DO-NOT-REMOVE STORES_MOCK_FALLBACK_VALUE

    registerFallbackValue(materialRoute(Container()));
    registerFallbackValue(MockDebouncer());
    registerFallbackValue(MockCurrentTimeProvider());
    registerFallbackValue(PeriodicTaskExecutor());
    registerFallbackValue(const LocalPreferences.empty());
  }
}
