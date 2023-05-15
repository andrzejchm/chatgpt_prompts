import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/helpers.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/core/utils/debouncer.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_form_data_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_form_data_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presentation_model.dart';

class PromptDetailsPresenter extends Cubit<PromptDetailsViewModel> {
  PromptDetailsPresenter(
    PromptDetailsPresentationModel super.model,
    this.navigator,
    this._debouncer,
    this._savePromptExecutionFormDataUseCase,
    this._getPromptExecutionFormDataUseCase,
  );

  final PromptDetailsNavigator navigator;

  final Debouncer _debouncer;
  final SavePromptExecutionFormDataUseCase _savePromptExecutionFormDataUseCase;
  final GetPromptExecutionFormDataUseCase _getPromptExecutionFormDataUseCase;
  PromptDetailsEventsListener? _eventsListener;

  // ignore: unused_element
  PromptDetailsPresentationModel get _model => state as PromptDetailsPresentationModel;

  void onPromptSelected(Prompt prompt) {
    if (_model.prompt != const Prompt.empty()) {
      _saveFormData();
      _debouncer.cancel();
    }

    tryEmit(
      _model.copyWith(
        prompt: prompt,
        formData: const PromptExecutionFormData.empty(),
      ),
    );
    _loadFormData();
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
        formData: _model.formData.byUpdatingVariable(
          slug: slug,
          value: value,
        ),
      ),
    );
    _debouncer.debounce(
      const Duration(seconds: 1),
      () => _saveFormData(),
    );
  }

  void setEventsListener(PromptDetailsEventsListener eventsListener) {
    _eventsListener = eventsListener;
  }

  Future<void> _saveFormData() async {
    final request = _model.promptExecutionRequest;
    await _savePromptExecutionFormDataUseCase
        .execute(
          formData: request.formData,
          promptId: request.prompt.id,
        )
        .doOn(
          fail: logError,
        );
  }

  Future<void> _loadFormData() async {
    final promptId = _model.prompt.id;
    await _getPromptExecutionFormDataUseCase.execute(promptId: promptId).doOn(
          fail: logError,
          success: (data) {
            if (_model.prompt.id == promptId) {
              tryEmit(_model.copyWith(formData: data));
            }
          },
        );
  }
}

abstract class PromptDetailsEventsListener {
  void onExecutePrompt(PromptExecutionRequest request);
}
