import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_list/prompts_list_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class PromptsListPresentationModel implements PromptsListViewModel {
  /// Creates the initial state
  PromptsListPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    PromptsListInitialParams initialParams,
  )   : prompts = const [],
        promptsResult = const FutureResult.empty();

  /// Used for the copyWith method
  PromptsListPresentationModel._(
    this.prompts,
    this.promptsResult,
  );

  @override
  final List<Prompt> prompts;
  final FutureResult<GetPromptsListResult> promptsResult;

  //copyWith
  PromptsListPresentationModel copyWith({
    List<Prompt>? prompts,
    FutureResult<GetPromptsListResult>? promptsResult,
  }) {
    return PromptsListPresentationModel._(
      prompts ?? this.prompts,
      promptsResult ?? this.promptsResult,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class PromptsListViewModel {
  List<Prompt> get prompts;
}
