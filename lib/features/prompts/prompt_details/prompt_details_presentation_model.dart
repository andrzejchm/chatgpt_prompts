import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class PromptDetailsPresentationModel implements PromptDetailsViewModel {
  /// Creates the initial state
  PromptDetailsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    PromptDetailsInitialParams initialParams,
  )   : prompt = initialParams.prompt,
        variableValues = {};

  /// Used for the copyWith method
  PromptDetailsPresentationModel._(
    this.prompt,
    this.variableValues,
  );

  @override
  final Prompt prompt;

  final Map<String, String> variableValues;

  PromptExecutionRequest get promptExecutionRequest => PromptExecutionRequest(
        prompt: prompt,
        variablesValues: variableValues,
      );

  //copyWith
  PromptDetailsPresentationModel copyWith({
    Prompt? prompt,
    Map<String, String>? variableValues,
  }) {
    return PromptDetailsPresentationModel._(
      prompt ?? this.prompt,
      variableValues ?? this.variableValues,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class PromptDetailsViewModel {
  Prompt get prompt;
}
