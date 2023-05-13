import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompt_execution_form_data_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mocks.dart';

void main() {
  late GetPromptExecutionFormDataUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = GetPromptExecutionFormDataUseCase(
      PromptsMocks.promptsRepository,
    );
    when(
      () => PromptsMocks.promptsRepository.getPromptExecutionFormData(
        promptId: any(named: 'promptId'),
      ),
    ).thenAnswer((_) async => right(Stubs.promptExecutionFormData));
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
    final useCase = getIt<GetPromptExecutionFormDataUseCase>();
    expect(useCase, isNotNull);
  });
}
