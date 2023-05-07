// ignore_for_file: unused-code, unused-files

import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_template_variable.dart';

class Stubs {
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
        variables: [
          PromptTemplateVariable(
            slug: 'greeting',
            position: promptTemplate.indexOf('{{greeting}}'),
            description: 'What user has said?',
          ),
          PromptTemplateVariable(
            slug: 'format',
            position: promptTemplate.indexOf('{{format}}'),
            description: 'What format to output in?',
          ),
        ],
      );
}
