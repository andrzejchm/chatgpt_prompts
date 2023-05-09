import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_presentation_model.dart';

class PromptExecutionPresenter extends Cubit<PromptExecutionViewModel> with SubscriptionsMixin {
  PromptExecutionPresenter(
    PromptExecutionPresentationModel super.model,
    this.navigator,
    this._executePromptUseCase,
  );

  final PromptExecutionNavigator navigator;
  final ExecutePromptUseCase _executePromptUseCase;

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
        );
  }
}
