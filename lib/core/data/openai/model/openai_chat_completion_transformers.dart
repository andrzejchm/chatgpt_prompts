import 'package:chatgpt_prompts/core/domain/model/chat_completion_choice.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_message_input.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_result.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_role.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_completion_usage.dart';
import 'package:chatgpt_prompts/core/domain/model/chat_message.dart';
import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk_choice.dart';
import 'package:dart_openai/openai.dart';

//ignore_for_file:prefer-match-file-name
extension ChatCompletionResultTransformer on OpenAIChatCompletionModel {
  ChatCompletionResult toChatCompletionResult() => ChatCompletionResult(
        id: id,
        createdUtc: created.toUtc().toIso8601String(),
        choices: choices.map((e) => e.toChatCompletionChoice()).toList(),
        usage: usage.toChatCompletionUsage(),
      );
}

extension ChatCompletionChoiceTransformer on OpenAIChatCompletionChoiceModel {
  ChatCompletionChoice toChatCompletionChoice() => ChatCompletionChoice(
        index: index,
        message: message.toChatMessage(),
        finishReason: finishReason,
      );
}

extension ChatMessageTransformer on OpenAIChatCompletionChoiceMessageModel {
  ChatMessage toChatMessage() => ChatMessage(
        content: content,
        role: role.toChatCompletionRole(),
      );
}

extension ChatCompletionMessageInputX on ChatCompletionMessageInput {
  OpenAIChatCompletionChoiceMessageModel toMessageModel() {
    return OpenAIChatCompletionChoiceMessageModel(
      content: message,
      role: role.toOpenAIChatMessageRole(),
    );
  }
}

extension ChatCompletionRoleX on ChatCompletionRole {
  OpenAIChatMessageRole toOpenAIChatMessageRole() {
    switch (this) {
      case ChatCompletionRole.system:
        return OpenAIChatMessageRole.system;
      case ChatCompletionRole.user:
        return OpenAIChatMessageRole.user;
      case ChatCompletionRole.assistant:
        return OpenAIChatMessageRole.assistant;
    }
  }
}

extension ChatCompletionUsageTransformer on OpenAIChatCompletionUsageModel {
  ChatCompletionUsage toChatCompletionUsage() => ChatCompletionUsage(
        promptTokens: promptTokens,
        completionTokens: completionTokens,
        totalTokens: totalTokens,
      );
}

extension ChatCompletionRoleTransformer on OpenAIChatMessageRole {
  ChatCompletionRole toChatCompletionRole() {
    switch (this) {
      case OpenAIChatMessageRole.system:
        return ChatCompletionRole.system;
      case OpenAIChatMessageRole.user:
        return ChatCompletionRole.user;
      case OpenAIChatMessageRole.assistant:
        return ChatCompletionRole.assistant;
    }
  }
}

extension CompletionStreamChunkTransformer on OpenAIStreamChatCompletionModel {
  CompletionStreamedChunk toChatCompletionResult(String model) => CompletionStreamedChunk(
        id: Id(id),
        created: created.toIso8601String(),
        choice: choices.first.toChatCompletionChoice(),
        model: model,
      );
}

//extension on OpenAIStreamChatCompletionChoiceModel to create CompletionStreamedChunkChoice
extension CompletionStreamChunkChoiceTransformer on OpenAIStreamChatCompletionChoiceModel {
  CompletionStreamedChunkChoice toChatCompletionChoice() => CompletionStreamedChunkChoice(
        index: index,
        text: delta.content ?? '',
        finishReason: finishReason ?? '',
      );
}
