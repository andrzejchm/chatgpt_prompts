import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/features/settings/settings_navigator.dart';
import 'package:chatgpt_prompts/features/settings/settings_presentation_model.dart';

class SettingsPresenter extends Cubit<SettingsViewModel> {
  SettingsPresenter(
    SettingsPresentationModel super.model,
    this.navigator,
  );

  final SettingsNavigator navigator;

  // ignore: unused_element
  SettingsPresentationModel get _model => state as SettingsPresentationModel;
}
