import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';

class PromptsPresenter extends Cubit<PromptsViewModel> {
  PromptsPresenter(
    PromptsPresentationModel super.model,
    this.navigator,
  );

  final PromptsNavigator navigator;

  // ignore: unused_element
  PromptsPresentationModel get _model => state as PromptsPresentationModel;
}
