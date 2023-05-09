import 'package:chatgpt_prompts/core/domain/model/stream_result.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_execution/prompt_execution_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class PromptExecutionPresentationModel implements PromptExecutionViewModel {
  /// Creates the initial state
  PromptExecutionPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    PromptExecutionInitialParams initialParams,
  )   : request = const PromptExecutionRequest.empty(),
        chunkedResponse = const CompletionStreamedChunk.empty(),
        executionResult = const StreamResult.empty();

  /// Used for the copyWith method
  PromptExecutionPresentationModel._(
    this.request,
    this.executionResult,
    this.chunkedResponse,
  );

  @override
  final CompletionStreamedChunk chunkedResponse;
  final PromptExecutionRequest request;

  @override
  final StreamResult<ExecutePromptResult> executionResult;

  @override
  String get finishReason => chunkedResponse.choice.finishReason;

  @override
  String get responseText => chunkedResponse.choice.text;

  //copyWith
  PromptExecutionPresentationModel copyWith({
    PromptExecutionRequest? request,
    StreamResult<ExecutePromptResult>? executionResult,
    CompletionStreamedChunk? chunkedResponse,
  }) {
    return PromptExecutionPresentationModel._(
      request ?? this.request,
      executionResult ?? this.executionResult,
      chunkedResponse ?? this.chunkedResponse,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class PromptExecutionViewModel {
  StreamResult<ExecutePromptResult> get executionResult;

  CompletionStreamedChunk get chunkedResponse;

  String get responseText;

  String get finishReason;
}
