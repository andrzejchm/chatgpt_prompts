import 'package:chatgpt_prompts/features/prompts/edit_prompt/edit_prompt_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class EditPromptPresentationModel implements EditPromptViewModel {
  /// Creates the initial state
  EditPromptPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    EditPromptInitialParams initialParams,
  );

  /// Used for the copyWith method
  EditPromptPresentationModel._();

  EditPromptPresentationModel copyWith() {
    return EditPromptPresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class EditPromptViewModel {}
