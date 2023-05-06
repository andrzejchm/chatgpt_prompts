import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';

class PromptDetailsPresenter extends Cubit<PromptDetailsViewModel> {
  PromptDetailsPresenter(
    PromptDetailsPresentationModel super.model,
    this.navigator,
  );

  final PromptDetailsNavigator navigator;

  // ignore: unused_element
  PromptDetailsPresentationModel get _model => state as PromptDetailsPresentationModel;
}
