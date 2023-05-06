// ignore_for_file: unused-code, unused-files

import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';

class Stubs {
  static Prompt get prompt => Prompt(
        name: 'Name',
        template: 'Template',
        id: const Id('prompt-id'),
        createdAtUtc: DateTime.now().toIso8601String(),
        updatedAtUtc: DateTime.now().toIso8601String(),
        description: 'Description',
        variables: const [],
      );
}
