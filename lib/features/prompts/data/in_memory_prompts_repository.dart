import 'dart:math';

import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt.dart';
import 'package:chatgpt_prompts/features/prompts/domain/repositories/prompts_repository.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';

class InMemoryPromptsRepository implements PromptsRepository {
  const InMemoryPromptsRepository();

  static final _templates = List.generate(
    5,
    (index) => Prompt(
      name: 'Name $index',
      template: 'Template $index',
      id: Id('id $index'),
      createdAtUtc: DateTime.now().toIso8601String(),
      updatedAtUtc: DateTime.now().toIso8601String(),
      description: 'Description $index',
      variables: const [],
    ),
  );

  @override
  Future<GetPromptsListResult> getPromptsList() async {
    //ignore: no-magic-number
    await Future.delayed(Duration(milliseconds: Random().nextInt(1000)));
    return success([..._templates]);
  }
}
