import 'package:chatgpt_prompts/core/domain/model/chat_message.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/utils/bloc_extensions.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class ChatPresentationModel implements ChatViewModel {
  /// Creates the initial state
  ChatPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    ChatInitialParams initialParams,
  )   : messages = [],
        currentPrompt = '',
        sendMessageStatus = const FutureResult.empty();

  /// Used for the copyWith method
  ChatPresentationModel._(
    this.messages,
    this.currentPrompt,
    this.sendMessageStatus,
  );

  @override
  final List<ChatMessage> messages;

  @override
  final String currentPrompt;

  final FutureResult<CreateChatCompletionResult> sendMessageStatus;

  @override
  bool get isLoading => sendMessageStatus.isPending();

  @override
  bool get sendEnabled => currentPrompt.isNotEmpty && !isLoading;

//copyWith method
  ChatPresentationModel copyWith({
    List<ChatMessage>? messages,
    String? currentPrompt,
    FutureResult<CreateChatCompletionResult>? sendMessageStatus,
  }) {
    return ChatPresentationModel._(
      messages ?? this.messages,
      currentPrompt ?? this.currentPrompt,
      sendMessageStatus ?? this.sendMessageStatus,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class ChatViewModel {
  List<ChatMessage> get messages;

  bool get isLoading;

  String get currentPrompt;

  bool get sendEnabled;
}
