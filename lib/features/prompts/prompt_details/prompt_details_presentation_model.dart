import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class PromptDetailsPresentationModel implements PromptDetailsViewModel {
  /// Creates the initial state
  PromptDetailsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    PromptDetailsInitialParams initialParams,
  )   : prompt = initialParams.prompt,
        formData = const PromptExecutionFormData.empty();

  /// Used for the copyWith method
  PromptDetailsPresentationModel._(
    this.prompt,
    this.formData,
  );

  @override
  final Prompt prompt;

  @override
  final PromptExecutionFormData formData;

  PromptExecutionRequest get promptExecutionRequest => PromptExecutionRequest(
        prompt: prompt,
        formData: formData,
      );

  //copyWith
  PromptDetailsPresentationModel copyWith({
    Prompt? prompt,
    PromptExecutionFormData? formData,
  }) {
    return PromptDetailsPresentationModel._(
      prompt ?? this.prompt,
      formData ?? this.formData,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class PromptDetailsViewModel {
  Prompt get prompt;

  PromptExecutionFormData get formData;
}
