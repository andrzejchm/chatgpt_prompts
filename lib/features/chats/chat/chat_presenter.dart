import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_result.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_message.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_navigator.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presentation_model.dart';

class ChatPresenter extends Cubit<ChatViewModel> {
  ChatPresenter(
    ChatPresentationModel super.model,
    this.navigator,
    this._createChatCompletionUseCase,
  );

  final ChatNavigator navigator;
  final CreateChatCompletionUseCase _createChatCompletionUseCase;

  // ignore: unused_element
  ChatPresentationModel get _model => state as ChatPresentationModel;

  void onTapSend() {
    _emitUserMessage();
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

  void _onMessageSent(ChatCompletionResult it) {
    return emit(
      _model.copyWith(
        messages: [
          ..._model.messages,
          ChatMessage.assistant(content: it.choices.first.message.content),
        ],
      ),
    );
  }

  void _emitUserMessage() {
    emit(
      _model.copyWith(
        messages: [
          ..._model.messages,
          ChatMessage.user(content: _model.currentPrompt),
        ],
        currentPrompt: '',
      ),
    );
  }
}
