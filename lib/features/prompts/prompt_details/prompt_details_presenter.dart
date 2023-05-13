import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/helpers.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/core/utils/debouncer.dart';
import 'package:chatgpt_prompts/core/utils/durations.dart';
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
    _saveFormData();
  }

  void setEventsListener(PromptDetailsEventsListener eventsListener) {
    _eventsListener = eventsListener;
  }

  void _saveFormData() {
    final request = _model.promptExecutionRequest;
    _debouncer.debounce(
      const LongDuration(),
      () {
        debugLog('Saving form data for prompt ${request.prompt.id}: ${request.formData}');
        return _savePromptExecutionFormDataUseCase.execute(
          formData: request.formData,
          promptId: request.prompt.id,
        );
      },
    );
  }

  void _loadFormData() {
    final promptId = _model.prompt.id;
    _getPromptExecutionFormDataUseCase
        .execute(
      promptId: promptId,
    )
        .doOn(
      success: (data) {
        debugLog('Loaded form data for prompt $promptId: $data');
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
