import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/features/prompts/domain/use_cases/get_prompts_list_use_case.dart';
import '../../../test_utils/test_utils.dart';

void main() {
  late GetPromptsListUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = const GetPromptsListUseCase();
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute();

      // THEN
      expect(result.isSuccess, false);
    },
  );

  test('getIt resolves successfully', () async {
    final useCase = getIt<GetPromptsListUseCase>();
    expect(useCase, isNotNull);
  });
}
