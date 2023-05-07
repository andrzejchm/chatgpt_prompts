import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/helpers.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';

class PromptDetailsPresenter extends Cubit<PromptDetailsViewModel> {
  PromptDetailsPresenter(
    PromptDetailsPresentationModel super.model,
    this.navigator,
  );

  final PromptDetailsNavigator navigator;
  PromptDetailsEventsListener? _eventsListener;

  // ignore: unused_element
  PromptDetailsPresentationModel get _model => state as PromptDetailsPresentationModel;

  void onPromptSelected(Prompt prompt) {
    tryEmit(_model.copyWith(prompt: prompt));
  }

  void onTapEdit() {
    //TODO: implement onTapEdit
    notImplemented();
  }

  void onTapExecute() {
    _eventsListener?.onExecutePrompt(
      _model.promptExecutionRequest,
    );
  }

  void onTapTemplate() {
    //TODO: implement onTapTemplate
    notImplemented();
  }

  void onVariableValueChanged(String slug, String value) {
    emit(
      _model.copyWith(
        variableValues: {
          ..._model.variableValues,
          slug: value,
        },
      ),
    );
  }

  void setEventsListener(PromptDetailsEventsListener eventsListener) {
    _eventsListener = eventsListener;
  }
}

abstract class PromptDetailsEventsListener {
  void onExecutePrompt(PromptExecutionRequest request);
}
