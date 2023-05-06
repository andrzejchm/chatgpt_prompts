import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/settings/settings_initial_params.dart';
import 'package:chatgpt_prompts/features/settings/settings_navigator.dart';
import 'package:chatgpt_prompts/features/settings/settings_page.dart';
import 'package:chatgpt_prompts/features/settings/settings_presentation_model.dart';
import 'package:chatgpt_prompts/features/settings/settings_presenter.dart';

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
        ..registerFactory<SettingsNavigator>(
          () => SettingsNavigator(getIt()),
        )
        ..registerFactoryParam<SettingsPresentationModel, SettingsInitialParams, dynamic>(
          (params, _) => SettingsPresentationModel.initial(params),
        )
        ..registerFactoryParam<SettingsPresenter, SettingsInitialParams, dynamic>(
          (params, _) => SettingsPresenter(getIt(param1: params), getIt()),
        )
        ..registerFactoryParam<SettingsPage, SettingsInitialParams, dynamic>(
          (params, _) => SettingsPage(presenter: getIt(param1: params)),
        )

//DO-NOT-REMOVE MVP_GET_IT_CONFIG
      ;
}
