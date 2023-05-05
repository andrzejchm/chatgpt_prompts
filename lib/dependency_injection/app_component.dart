import 'package:chatgpt_prompts/core/data/dart_openai_repository.dart';
import 'package:chatgpt_prompts/core/data/dotenv_config_provider.dart';
import 'package:chatgpt_prompts/core/domain/providers/config_provider.dart';
import 'package:chatgpt_prompts/core/domain/repositories/openai_repository.dart';
import 'package:chatgpt_prompts/core/domain/stores/user_store.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/utils/current_time_provider.dart';
import 'package:chatgpt_prompts/features/app_init/dependency_injection/feature_component.dart' as app_init;
import 'package:chatgpt_prompts/features/auth/dependency_injection/feature_component.dart' as auth;
import 'package:chatgpt_prompts/features/main/dependency_injection/feature_component.dart' as main;
import 'package:chatgpt_prompts/navigation/app_navigator.dart';
import 'package:get_it/get_it.dart';
//DO-NOT-REMOVE APP_COMPONENT_IMPORTS

final getIt = GetIt.instance;

/// registers all the dependencies in dependency graph in get_it package
void configureDependencies() {
  app_init.configureDependencies();
  auth.configureDependencies();
  main.configureDependencies();
//DO-NOT-REMOVE FEATURE_COMPONENT_INIT

  _configureGeneralDependencies();
  _configureRepositories();
  _configureStores();
  _configureUseCases();
  _configureMvp();
}

//ignore: long-method
void _configureGeneralDependencies() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<AppNavigator>(
          () => AppNavigator(),
        )
        ..registerFactory<ConfigProvider>(
          () => DotenvConfigProvider(),
        )
        ..registerFactory(() => const CurrentTimeProvider())
      //DO-NOT-REMOVE GENERAL_DEPS_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureRepositories() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<OpenaiRepository>(
          () => DartOpenaiRepository(
            getIt(),
          ),
        )
//DO-NOT-REMOVE REPOSITORIES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureStores() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<UserStore>(
          () => UserStore(),
        )
      //DO-NOT-REMOVE STORES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureUseCases() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<CreateChatCompletionUseCase>(
          () => CreateChatCompletionUseCase(
            getIt(),
          ),
        )

//DO-NOT-REMOVE USE_CASES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureMvp() {
  // ignore: unnecessary_statements
  getIt
      //DO-NOT-REMOVE MVP_GET_IT_CONFIG
      ;
}
