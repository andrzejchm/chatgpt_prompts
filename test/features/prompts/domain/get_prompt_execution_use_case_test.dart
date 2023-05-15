import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_use_case.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mocks.dart';

void main() {
  late GetPromptExecutionUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = GetPromptExecutionUseCase(
      PromptsMocks.promptsRepository,
    );
    when(
      () => PromptsMocks.promptsRepository.getPromptExecution(
        promptId: any(named: 'promptId'),
      ),
    ).thenAnswer((_) async => success(Stubs.completionStreamedChunk));
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute(
        promptId: Stubs.prompt.id,
      );

      // THEN
      expect(result.isSuccess, true);
    },
  );

  test('getIt resolves successfully', () async {
    final useCase = getIt<GetPromptExecutionUseCase>();
    expect(useCase, isNotNull);
  });
}
