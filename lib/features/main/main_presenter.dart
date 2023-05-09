import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/domain/model/main_tab.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/get_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/save_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/main/main_navigator.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';

class MainPresenter extends Cubit<MainViewModel> {
  MainPresenter(
    MainPresentationModel super.model,
    this.navigator,
    this._getLocalPreferencesUseCase,
    this._saveLocalPreferencesUseCase,
  );

  final MainNavigator navigator;
  final GetLocalPreferencesUseCase _getLocalPreferencesUseCase;
  final SaveLocalPreferencesUseCase _saveLocalPreferencesUseCase;

  // ignore: unused_element
  MainPresentationModel get _model => state as MainPresentationModel;

  void onInit() {
    _preselectTab();
  }

  Future<void> onTabSelected(int index) async {
    final tab = MainTab.values[index];
    emit(_model.copyWith(selectedTab: tab));
    await _saveLocalPreferencesUseCase.execute(
      prefsUpdater: (prefs) => prefs.copyWith(mainTab: tab),
    );
  }

  @override
  Future<void> close() async {
    await super.close();
    await state.chatPresenter.close();
  }

  void _preselectTab() {
    _getLocalPreferencesUseCase.execute().doOn(
          success: (it) => tryEmit(
            _model.copyWith(
              selectedTab: it.mainTab,
            ),
          ),
        );
  }
}
