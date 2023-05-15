import 'dart:math';

import 'package:chatgpt_prompts/core/data/hive/hive_client.dart';
import 'package:chatgpt_prompts/core/data/openai/open_ai_client.dart';
import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/execute_prompt_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/get_prompt_execution_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/get_prompt_execution_form_data_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_template_variable.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/save_prompt_execution_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/save_prompt_execution_form_data_failure.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_form_data_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_form_data_use_case.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_use_case.dart';
import 'package:chatgpt_prompts/utils/to_either_transformer.dart';

class OpenaiPromptsRepository implements PromptsRepository {
  const OpenaiPromptsRepository(
    this._hiveClient,
    this._openAIClient,
  );

  static List<Prompt> prompts = [
    Prompt(
      name: 'Create greeting',
      template: '''
      create a greeting message to the user that said the following
       ```{{greeting}}```
      make the response with {{format}} format
      '''
          .trim(),
      id: const Id('id-greeting'),
      createdAtUtc: DateTime.now().toIso8601String(),
      updatedAtUtc: DateTime.now().toIso8601String(),
      description: 'Creates greeting in specified format',
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
    ),
    Prompt(
      name: 'Create user object',
      template: '''
Create new User entity class in {{language}}. It needs to contain the following fields: username, id, roles, permissions. Wrap result into github markdown syntax with language hint'''
          .trim(),
      id: const Id('id-create-user-object'),
      createdAtUtc: DateTime.now().toIso8601String(),
      updatedAtUtc: DateTime.now().toIso8601String(),
      description: 'Creates user object in specified language',
      variables: const [
        PromptTemplateVariable(
          slug: 'language',
          description: 'What format to output in?',
        ),
      ],
    ),
  ];
  final HiveClient _hiveClient;

  final OpenAIClient _openAIClient;

  @override
  Future<GetPromptsListResult> getPromptsList() async {
    //TODO implement real call to db
    //ignore: no-magic-number
    await Future.delayed(Duration(milliseconds: Random().nextInt(1000)));
    return success([...prompts]);
  }

  @override
  Stream<ExecutePromptResult> executePrompt({
    required PromptExecutionRequest request,
  }) {
    return _openAIClient
        .executePrompt(request: request) //
        .toEither(
          mapError: (err, stack) => ExecutePromptFailure.unknown(err),
        );
  }

  @override
  Future<SavePromptExecutionFormDataResult> savePromptExecutionFormData({
    required Id promptId,
    required PromptExecutionFormData formData,
  }) async {
    return _hiveClient
        .saveObject<PromptExecutionFormData>(
          boxId: HiveBoxId.promptExecutionFormData,
          objectKey: promptId.value,
          object: formData,
        )
        .mapFailure(SavePromptExecutionFormDataFailure.unknown);
  }

  @override
  Future<GetPromptExecutionFormDataResult> getPromptExecutionFormData({
    required Id promptId,
  }) {
    return _hiveClient
        .readObject<PromptExecutionFormData>(
          boxId: HiveBoxId.promptExecutionFormData,
          objectKey: promptId.value,
        )
        .mapSuccess((response) => response ?? const PromptExecutionFormData.empty())
        .mapFailure((fail) => GetPromptExecutionFormDataFailure.unknown(fail));
  }

  @override
  Future<GetPromptExecutionResult> getPromptExecution({
    required Id promptId,
  }) {
    return _hiveClient
        .readObject<CompletionStreamedChunk>(
          boxId: HiveBoxId.completionStreamedChunk,
          objectKey: promptId.value,
        )
        .mapSuccess((response) => response ?? const CompletionStreamedChunk.empty())
        .mapFailure((fail) => GetPromptExecutionFailure.unknown(fail));
  }

  @override
  Future<SavePromptExecutionResult> savePromptExecution({
    required Id promptId,
    required CompletionStreamedChunk streamedChunk,
  }) {
    return _hiveClient
        .saveObject<CompletionStreamedChunk>(
          boxId: HiveBoxId.completionStreamedChunk,
          objectKey: promptId.value,
          object: streamedChunk,
        )
        .mapFailure(SavePromptExecutionFailure.unknown);
  }
}
