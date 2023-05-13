// ignore_for_file: unused-code, unused-files

import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/core/domain/model/local_preferences.dart';
import 'package:chatgpt_prompts/core/domain/model/main_tab.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk_choice.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_template_variable.dart';

class Stubs {
  static LocalPreferences get localPreferences => const LocalPreferences(
        mainTab: MainTab.chat,
      );

  static CompletionStreamedChunk get completionStreamedChunk => CompletionStreamedChunk(
        id: 'id',
        created: DateTime.now().toIso8601String(),
        choice: const CompletionStreamedChunkChoice(
          text: 'text',
          index: 0,
          finishReason: '',
        ),
        model: 'gpt-3.5-turbo',
      );

  static CompletionStreamedChunkChoice get completionStreamedChunkChoice => const CompletionStreamedChunkChoice(
        text: 'text',
        index: 0,
        finishReason: '',
      );

  static List<Prompt> get promptsList => List.generate(
        10,
        (index) => Stubs.prompt.copyWith(
          id: Id('prompt-$index'),
          name: 'Prompt $index',
        ),
      );

  static String get promptTemplate => '''
      create a greeting message to the user that said the following
       ```{{greeting}}```
      make the response with {{format}} format
      '''
      .trim();

  static Prompt get prompt => Prompt(
        name: 'Prompt name',
        template: promptTemplate,
        id: const Id('id-prompt'),
        createdAtUtc: DateTime.now().toIso8601String(),
        updatedAtUtc: DateTime.now().toIso8601String(),
        description: 'Description',
        variables: const [
          PromptTemplateVariable(
            slug: 'greeting',
            description: 'What user has said?',
          ),
          PromptTemplateVariable(
            slug: 'format',
            description: 'What format to output in?',
          ),
        ],
      );

  static PromptExecutionRequest get promptExecutionRequest => PromptExecutionRequest(
        prompt: prompt,
        formData: promptExecutionFormData,
      );

  static PromptExecutionFormData get promptExecutionFormData => const PromptExecutionFormData(
        variablesValues: {
          'greeting': 'Hello',
          'format': 'JSON',
        },
      );
}
