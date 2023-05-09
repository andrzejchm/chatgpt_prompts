import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_navigator.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presentation_model.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presenter.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_page.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_initial_params.dart';
import 'package:chatgpt_prompts/features/chats/data/openai_chats_repository.dart';
import 'package:chatgpt_prompts/features/chats/domain/repositories/chats_repository.dart';
//DO-NOT-REMOVE APP_COMPONENT_IMPORTS

/// registers all the dependencies in dependency graph in get_it package
void configureDependencies() {
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
      //DO-NOT-REMOVE GENERAL_DEPS_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureRepositories() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<ChatsRepository>(
          () => OpenaiChatsRepository(
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
      //DO-NOT-REMOVE STORES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureUseCases() {
  // ignore: unnecessary_statements
  getIt
      //DO-NOT-REMOVE USE_CASES_GET_IT_CONFIG
      ;
}

//ignore: long-method
void _configureMvp() {
  // ignore: unnecessary_statements
  getIt
        ..registerFactory<ChatNavigator>(
          () => ChatNavigator(getIt()),
        )
        ..registerFactoryParam<ChatPresentationModel, ChatInitialParams, dynamic>(
          (params, _) => ChatPresentationModel.initial(params),
        )
        ..registerFactoryParam<ChatPresenter, ChatInitialParams, dynamic>(
          (params, _) => ChatPresenter(
            getIt(param1: params),
            getIt(),
            getIt(),
          ),
        )
        ..registerFactoryParam<ChatPage, ChatInitialParams, dynamic>(
          (params, _) => ChatPage(presenter: getIt(param1: params)),
        )

//DO-NOT-REMOVE MVP_GET_IT_CONFIG
      ;
}
