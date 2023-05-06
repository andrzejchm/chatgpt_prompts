import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_presentation_model.dart';

class EditPromptPresenter extends Cubit<EditPromptViewModel> {
  EditPromptPresenter(
    EditPromptPresentationModel super.model,
    this.navigator,
  );

  final EditPromptNavigator navigator;

  // ignore: unused_element
  EditPromptPresentationModel get _model => state as EditPromptPresentationModel;
}
