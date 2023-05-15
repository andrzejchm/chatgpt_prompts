import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_use_case.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mocks.dart';

void main() {
  late SavePromptExecutionUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = SavePromptExecutionUseCase(
      PromptsMocks.promptsRepository,
    );
    when(
      () => PromptsMocks.promptsRepository.savePromptExecution(
        promptId: any(named: 'promptId'),
        streamedChunk: any(named: 'streamedChunk'),
      ),
    ).thenAnswer((_) async => success(unit));
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute(
        promptId: Stubs.prompt.id,
        streamedChunk: Stubs.completionStreamedChunk,
      );

      // THEN
      expect(result.isSuccess, true);
    },
  );

  test('getIt resolves successfully', () async {
    final useCase = getIt<SavePromptExecutionUseCase>();
    expect(useCase, isNotNull);
  });
}
