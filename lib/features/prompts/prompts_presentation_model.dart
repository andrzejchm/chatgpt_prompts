import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_presenter.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class PromptsPresentationModel implements PromptsViewModel {
  /// Creates the initial state
  PromptsPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    PromptsInitialParams initialParams,
    this.promptsListPresenter,
    this.promptDetailsPresenter,
  );

  /// Used for the copyWith method
  PromptsPresentationModel._(
    this.promptsListPresenter,
    this.promptDetailsPresenter,
  );

  @override
  final PromptsListPresenter promptsListPresenter;
  @override
  final PromptDetailsPresenter promptDetailsPresenter;

  //copyWith
  PromptsPresentationModel copyWith({
    PromptsListPresenter? promptsListPresenter,
    PromptDetailsPresenter? promptDetailsPresenter,
  }) {
    return PromptsPresentationModel._(
      promptsListPresenter ?? this.promptsListPresenter,
      promptDetailsPresenter ?? this.promptDetailsPresenter,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class PromptsViewModel {
  PromptsListPresenter get promptsListPresenter;

  PromptDetailsPresenter get promptDetailsPresenter;
}
