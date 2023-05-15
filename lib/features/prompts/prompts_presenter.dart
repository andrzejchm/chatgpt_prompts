import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_navigator.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presentation_model.dart';

class PromptsPresenter extends Cubit<PromptsViewModel> with SubscriptionsMixin implements PromptDetailsEventsListener {
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
          _model.promptExecutionPresenter.onPromptSelected(listState.selectedPrompt);
        }
      },
    );
    _model.promptDetailsPresenter.setEventsListener(this);
  }

  final PromptsNavigator navigator;

  // ignore: unused_element
  PromptsPresentationModel get _model => state as PromptsPresentationModel;

  @override
  void onExecutePrompt(PromptExecutionRequest request) {
    _model.promptExecutionPresenter.onExecutePrompt(request);
  }
}
