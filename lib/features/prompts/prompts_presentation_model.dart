import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class PromptsPresentationModel implements PromptsViewModel {
  /// Creates the initial state
  PromptsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    PromptsInitialParams initialParams,
  );

  /// Used for the copyWith method
  PromptsPresentationModel._();

  PromptsPresentationModel copyWith() {
    return PromptsPresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class PromptsViewModel {}
