import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/save_prompt_execution_form_data_use_case.dart';
import '../../../mocks/stubs.dart';
import '../../../test_utils/test_utils.dart';
import '../mocks/prompts_mocks.dart';

void main() {
  late SavePromptExecutionFormDataUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = SavePromptExecutionFormDataUseCase(
      PromptsMocks.promptsRepository,
    );
    when(
      () => PromptsMocks.promptsRepository.savePromptExecutionFormData(
        formData: any(named: 'formData'),
        promptId: any(named: 'promptId'),
      ),
    ).thenAnswer((_) async => right(unit));
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute(
        formData: Stubs.promptExecutionFormData,
        promptId: Stubs.prompt.id,
      );

      // THEN
      expect(result.isSuccess, true);
    },
  );

  test('getIt resolves successfully', () async {
    final useCase = getIt<SavePromptExecutionFormDataUseCase>();
    expect(useCase, isNotNull);
  });
}
