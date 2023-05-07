import 'dart:math';

import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_template_variable.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';

class InMemoryPromptsRepository implements PromptsRepository {
  const InMemoryPromptsRepository();

  static final _templates = List.generate(
    5,
    (index) => Prompt(
      name: 'Name $index',
      template: '''
      create a greeting message to the user that said the following
       ```{{greeting}}```
      make the response with {{format}} format
      '''
          .trim(),
      id: Id('id $index'),
      createdAtUtc: DateTime.now().toIso8601String(),
      updatedAtUtc: DateTime.now().toIso8601String(),
      description: 'Description $index',
      variables: const [
        PromptTemplateVariable(
          slug: 'greeting',
          position: 72,
          description: 'What user has said?',
        ),
        PromptTemplateVariable(
          slug: 'format',
          position: 117,
          description: 'What format to output in?',
        ),
      ],
    ),
  );

  @override
  Future<GetPromptsListResult> getPromptsList() async {
    //ignore: no-magic-number
    await Future.delayed(Duration(milliseconds: Random().nextInt(1000)));
    return success([..._templates]);
  }
}
