import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_request.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/execute_prompt_use_case.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mocks.dart';

void main() {
  late ExecutePromptUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = ExecutePromptUseCase(
      PromptsMocks.promptsRepository,
    );
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN
      CompletionStreamedChunk chunk(String text) =>
          Stubs.completionStreamedChunk.copyWith(choice: Stubs.completionStreamedChunkChoice.copyWith(text: text));
      when(() => PromptsMocks.promptsRepository.executePrompt(request: any(named: 'request'))) //
          .thenAnswer(
        (_) => Stream.fromIterable(
          [
            success(chunk('Hello')),
            success(chunk('World')),
          ],
        ),
      );
      when(() => PromptsMocks.promptsRepository.executePrompt(request: any(named: 'request'))) //
          .thenAnswer(
        (_) => Stream.fromIterable(
          [
            success(chunk('a')),
            success(chunk('n')),
            success(chunk('d')),
            success(chunk('r')),
            success(chunk('z')),
            success(chunk('e')),
            success(chunk('j')),
          ],
        ),
      );

      // WHEN
      final results = await useCase
          .execute(
            request: PromptExecutionRequest(
              prompt: Stubs.prompt,
              variablesValues: const {
                'greeting': 'Hello',
                'format': 'json',
              },
            ),
          )
          .toList();

      // THEN
      expect(results.map((e) => e.getSuccess()?.choice.text).toList(), ['a', 'n', 'd', 'r', 'z', 'e', 'j']);
    },
  );

  test('getIt resolves successfully', () async {
    final useCase = getIt<ExecutePromptUseCase>();
    expect(useCase, isNotNull);
  });
}
