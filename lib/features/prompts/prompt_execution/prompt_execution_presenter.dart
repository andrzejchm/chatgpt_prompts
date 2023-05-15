import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presentation_model.dart';

class PromptExecutionPresenter extends Cubit<PromptExecutionViewModel> with SubscriptionsMixin {
  PromptExecutionPresenter(
    PromptExecutionPresentationModel super.model,
    this.navigator,
    this._executePromptUseCase,
    this._savePromptExecutionUseCase,
    this._getPromptExecutionUseCase,
  );

  final PromptExecutionNavigator navigator;
  final ExecutePromptUseCase _executePromptUseCase;
  final SavePromptExecutionUseCase _savePromptExecutionUseCase;
  final GetPromptExecutionUseCase _getPromptExecutionUseCase;

  // ignore: unused_element
  PromptExecutionPresentationModel get _model => state as PromptExecutionPresentationModel;

  void onExecutePrompt(PromptExecutionRequest request) {
    tryEmit(
      _model.copyWith(
        request: request,
        chunkedResponse: const CompletionStreamedChunk.empty(),
      ),
    );

    _executePromptUseCase
        .execute(request: request) //
        .observeStatusChanges(
          onSubscribed: (subscription) => addSubscription(
            subscriptionId: 'execute_prompt',
            subscription: subscription,
          ),
          onStatusChange: (status) => emit(_model.copyWith(executionResult: status)),
          onEmit: (data) => data.fold(
            (fail) => navigator.showError(fail.displayableFailure()),
            (chunk) => tryEmit(
              _model.copyWith(
                chunkedResponse: _model.chunkedResponse + chunk,
              ),
            ),
          ),
          onDone: () => _savePromptExecutionUseCase.execute(
            promptId: _model.prompt.id,
            streamedChunk: _model.chunkedResponse,
          ),
        );
  }

  void onPromptSelected(Prompt selectedPrompt) {
    tryEmit(_model.copyWith(prompt: selectedPrompt));
    _getPromptExecutionUseCase.execute(promptId: selectedPrompt.id).doOn(
          success: (result) {
            tryEmit(
              _model.copyWith(
                chunkedResponse: result,
              ),
            );
          },
          fail: logError,
        );
  }
}
