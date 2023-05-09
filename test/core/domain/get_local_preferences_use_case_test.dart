import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/domain/use_cases/get_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import '../../mocks/mocks.dart';
import '../../mocks/stubs.dart';
import '../../test_utils/test_utils.dart';

void main() {
  late GetLocalPreferencesUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = GetLocalPreferencesUseCase(
      Mocks.localPreferencesRepository,
    );
    when(() => Mocks.localPreferencesRepository.getLocalPreferences())
        .thenAnswer((_) async => success(Stubs.localPreferences));
    when(() => Mocks.getLocalPreferencesUseCase.execute()).thenAnswer((_) async => success(Stubs.localPreferences));
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute();
      verify(() => Mocks.localPreferencesRepository.getLocalPreferences());
      // THEN
      expect(result.isSuccess, true);
    },
  );

  test('getIt resolves successfully', () async {
    final useCase = getIt<GetLocalPreferencesUseCase>();
    expect(useCase, isNotNull);
  });
}
