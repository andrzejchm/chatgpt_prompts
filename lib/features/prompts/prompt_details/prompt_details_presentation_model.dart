import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class PromptDetailsPresentationModel implements PromptDetailsViewModel {
  /// Creates the initial state
  PromptDetailsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    PromptDetailsInitialParams initialParams,
  );

  /// Used for the copyWith method
  PromptDetailsPresentationModel._();

  PromptDetailsPresentationModel copyWith() {
    return PromptDetailsPresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class PromptDetailsViewModel {}
