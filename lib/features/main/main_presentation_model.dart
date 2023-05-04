import 'package:chatgpt_prompts/features/main/main_initial_params.dart';



/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class MainPresentationModel implements MainViewModel {
  /// Creates the initial state
  MainPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    MainInitialParams initialParams,
  );

  /// Used for the copyWith method
  MainPresentationModel._();

  MainPresentationModel copyWith() {
    return MainPresentationModel._();
  }
}

/// Interface to expose fields used by the view (page).
abstract class MainViewModel {}
