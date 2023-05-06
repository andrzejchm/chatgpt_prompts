import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/features/main/main_navigator.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';

class MainPresenter extends Cubit<MainViewModel> {
  MainPresenter(
    MainPresentationModel super.model,
    this.navigator,
  );

  final MainNavigator navigator;

  // ignore: unused_element
  MainPresentationModel get _model => state as MainPresentationModel;

  void onTabSelected(int index) {
    final tab = MainTab.values[index];
    emit(_model.copyWith(selectedTab: tab));
  }

  @override
  Future<void> close() async {
    await super.close();
    await state.chatPresenter.close();
  }
}
