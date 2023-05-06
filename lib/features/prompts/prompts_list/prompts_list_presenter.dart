import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presentation_model.dart';

class PromptsListPresenter extends Cubit<PromptsListViewModel> {
  PromptsListPresenter(
    PromptsListPresentationModel super.model,
    this.navigator,
  );

  final PromptsListNavigator navigator;

  // ignore: unused_element
  PromptsListPresentationModel get _model => state as PromptsListPresentationModel;
}
