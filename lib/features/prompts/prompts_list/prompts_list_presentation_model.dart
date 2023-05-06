import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class PromptsListPresentationModel implements PromptsListViewModel {
  /// Creates the initial state
  PromptsListPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    PromptsListInitialParams initialParams,
  );

  /// Used for the copyWith method
  PromptsListPresentationModel._();

  PromptsListPresentationModel copyWith() {
    return PromptsListPresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class PromptsListViewModel {}
