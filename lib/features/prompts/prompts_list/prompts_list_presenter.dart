import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presentation_model.dart';
import 'package:flutter/cupertino.dart';

class PromptsListPresenter extends Cubit<PromptsListViewModel> {
  PromptsListPresenter(
    PromptsListPresentationModel super.model,
    this.navigator,
    this._getPromptsListUseCase,
  );

  final PromptsListNavigator navigator;
  final GetPromptsListUseCase _getPromptsListUseCase;

  // ignore: unused_element
  PromptsListPresentationModel get _model => state as PromptsListPresentationModel;

  void onInit() {
    getPromptsList();
  }

  Future<void> getPromptsList() async {
    await _getPromptsListUseCase
        .execute() //
        .observeStatusChanges(
          (result) => tryEmit(_model.copyWith(promptsResult: result)),
        )
        .asyncFold(
          (failure) => navigator.showError(failure.displayableFailure()),
          (list) => tryEmit(_model.copyWith(prompts: list)),
        );
  }

  void onTapPrompt(Prompt prompt) {
    //todo
    debugPrint('onTapPrompt: $prompt');
  }
}
