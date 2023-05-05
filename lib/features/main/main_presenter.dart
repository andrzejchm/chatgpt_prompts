import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_message.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/main/main_navigator.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:dart_openai/openai.dart';

class MainPresenter extends Cubit<MainViewModel> {
  MainPresenter(
    MainPresentationModel super.model,
    this.navigator,
    this._createChatCompletionUseCase,
  );

  final MainNavigator navigator;
  final CreateChatCompletionUseCase _createChatCompletionUseCase;

  // ignore: unused_element
  MainPresentationModel get _model => state as MainPresentationModel;

  void onTapSend() {
    final currentPrompt = _model.currentPrompt;
    _emitUserMessage(currentPrompt);
    _createChatCompletionUseCase
        .execute(
          inputs: [
            const ChatCompletionMessageInput.system(
              message: "You are a sarcastic bot that is very bored and doesn't "
                  "like responding to people's questions, always give wrong answers, off topic."
                  ' always respond in the same language as the previous prompt.',
            ),
            ..._model.messages.map((e) => e.toInput()),
          ],
        )
        .observeStatusChanges((it) => emit(_model.copyWith(sendMessageStatus: it)))
        .asyncFold(
          (failure) => navigator.showError(failure.displayableFailure()),
          (it) => _onMessageSent(it),
        );
  }

  void onTextChanged(String text) => emit(
        _model.copyWith(
          currentPrompt: text,
        ),
      );

  void _onMessageSent(OpenAIChatCompletionModel it) {
    return emit(
      _model.copyWith(
        messages: [
          ..._model.messages,
          ChatMessage.assistant(message: it.choices.first.message.content),
        ],
      ),
    );
  }

  void _emitUserMessage(String currentPrompt) {
    emit(
      _model.copyWith(
        messages: [
          ..._model.messages,
          ChatMessage.user(message: currentPrompt),
        ],
        currentPrompt: '',
      ),
    );
  }
}
