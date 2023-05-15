import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/data/openai_prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_form_data_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_form_data_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_page.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presentation_model.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';
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
        ..registerFactory<PromptsRepository>(
          () => OpenaiPromptsRepository(
            getIt(),
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
        ..registerFactory<GetPromptsListUseCase>(
          () => GetPromptsListUseCase(
            getIt(),
          ),
        )
        ..registerFactory<ExecutePromptUseCase>(
          () => ExecutePromptUseCase(
            getIt(),
          ),
        )
        ..registerFactory<SavePromptExecutionFormDataUseCase>(
          () => SavePromptExecutionFormDataUseCase(
            getIt(),
          ),
        )
        ..registerFactory<GetPromptExecutionFormDataUseCase>(
          () => GetPromptExecutionFormDataUseCase(
            getIt(),
          ),
        )
        ..registerFactory<SavePromptExecutionUseCase>(
          () => SavePromptExecutionUseCase(
            getIt(),
          ),
        )
        ..registerFactory<GetPromptExecutionUseCase>(
          () => GetPromptExecutionUseCase(
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
        ..registerFactory<PromptsNavigator>(
          () => PromptsNavigator(getIt()),
        )
        ..registerFactoryParam<PromptsPresentationModel, PromptsInitialParams, dynamic>(
          (params, _) => PromptsPresentationModel.initial(
            params,
            getIt<PromptsListPresenter>(param1: const PromptsListInitialParams()),
            getIt<PromptDetailsPresenter>(param1: const PromptDetailsInitialParams()),
            getIt<PromptExecutionPresenter>(param1: const PromptExecutionInitialParams()),
          ),
        )
        ..registerFactoryParam<PromptsPresenter, PromptsInitialParams, dynamic>(
          (params, _) => PromptsPresenter(getIt(param1: params), getIt()),
        )
        ..registerFactoryParam<PromptsPage, PromptsInitialParams, dynamic>(
          (params, _) => PromptsPage(presenter: getIt(param1: params)),
        )
        ..registerFactory<PromptsListNavigator>(
          () => PromptsListNavigator(getIt()),
        )
        ..registerFactoryParam<PromptsListPresentationModel, PromptsListInitialParams, dynamic>(
          (params, _) => PromptsListPresentationModel.initial(params),
        )
        ..registerFactoryParam<PromptsListPresenter, PromptsListInitialParams, dynamic>(
          (params, _) => PromptsListPresenter(
            getIt(param1: params),
            getIt(),
            getIt(),
          ),
        )
        ..registerFactoryParam<PromptsListPage, PromptsListInitialParams, dynamic>(
          (params, _) => PromptsListPage(presenter: getIt(param1: params)),
        )
        ..registerFactory<EditPromptNavigator>(
          () => EditPromptNavigator(getIt()),
        )
        ..registerFactoryParam<EditPromptPresentationModel, EditPromptInitialParams, dynamic>(
          (params, _) => EditPromptPresentationModel.initial(params),
        )
        ..registerFactoryParam<EditPromptPresenter, EditPromptInitialParams, dynamic>(
          (params, _) => EditPromptPresenter(getIt(param1: params), getIt()),
        )
        ..registerFactoryParam<EditPromptPage, EditPromptInitialParams, dynamic>(
          (params, _) => EditPromptPage(presenter: getIt(param1: params)),
        )
        ..registerFactory<PromptDetailsNavigator>(
          () => PromptDetailsNavigator(getIt()),
        )
        ..registerFactoryParam<PromptDetailsPresentationModel, PromptDetailsInitialParams, dynamic>(
          (params, _) => PromptDetailsPresentationModel.initial(params),
        )
        ..registerFactoryParam<PromptDetailsPresenter, PromptDetailsInitialParams, dynamic>(
          (params, _) => PromptDetailsPresenter(
            getIt(param1: params),
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        )
        ..registerFactoryParam<PromptDetailsPage, PromptDetailsInitialParams, dynamic>(
          (params, _) => PromptDetailsPage(presenter: getIt(param1: params)),
        )
        ..registerFactory<PromptExecutionNavigator>(
          () => PromptExecutionNavigator(getIt()),
        )
        ..registerFactoryParam<PromptExecutionPresentationModel, PromptExecutionInitialParams, dynamic>(
          (params, _) => PromptExecutionPresentationModel.initial(params),
        )
        ..registerFactoryParam<PromptExecutionPresenter, PromptExecutionInitialParams, dynamic>(
          (params, _) => PromptExecutionPresenter(
            getIt(param1: params),
            getIt(),
            getIt(),
            getIt(),
            getIt(),
          ),
        )
        ..registerFactoryParam<PromptExecutionPage, PromptExecutionInitialParams, dynamic>(
          (params, _) => PromptExecutionPage(presenter: getIt(param1: params)),
        )

//DO-NOT-REMOVE MVP_GET_IT_CONFIG
      ;
}
