import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';

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
        ..registerFactory<PromptsNavigator>(
          () => PromptsNavigator(getIt()),
        )
        ..registerFactoryParam<PromptsPresentationModel, PromptsInitialParams, dynamic>(
          (params, _) => PromptsPresentationModel.initial(params),
        )
        ..registerFactoryParam<PromptsPresenter, PromptsInitialParams, dynamic>(
          (params, _) => PromptsPresenter(getIt(param1: params), getIt()),
        )
        ..registerFactoryParam<PromptsPage, PromptsInitialParams, dynamic>(
          (params, _) => PromptsPage(presenter: getIt(param1: params)),
        )

//DO-NOT-REMOVE MVP_GET_IT_CONFIG
      ;
}
