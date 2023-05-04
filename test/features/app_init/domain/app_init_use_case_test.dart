import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/core/domain/use_cases/app_init_use_case.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';

import '../../../test_utils/test_utils.dart';

void main() {
  late AppInitUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = const AppInitUseCase();
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute();

      // THEN
      expect(result.isRight(), true);
    },
  );

  test(
    'getIt resolves successfully',
    () async {
      final useCase = getIt<AppInitUseCase>();
      expect(useCase, isNotNull);
    },
  );
}
