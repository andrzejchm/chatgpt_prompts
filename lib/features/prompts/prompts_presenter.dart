import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';

class PromptsPresenter extends Cubit<PromptsViewModel> with SubscriptionsMixin {
  PromptsPresenter(
    PromptsPresentationModel super.model,
    this.navigator,
  ) {
    listenTo(
      stream: _model.promptsListPresenter.stream,
      subscriptionId: 'prompts-list',
      onChange: (listState) {
        if (listState.selectedPrompt != _model.promptDetailsPresenter.state.prompt) {
          _model.promptDetailsPresenter.onPromptSelected(listState.selectedPrompt);
        }
      },
    );
  }

  final PromptsNavigator navigator;

  // ignore: unused_element
  PromptsPresentationModel get _model => state as PromptsPresentationModel;
}
