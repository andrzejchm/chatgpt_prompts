import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/domain/model/main_tab.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/save_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import '../../mocks/mocks.dart';
import '../../mocks/stubs.dart';
import '../../test_utils/test_utils.dart';

void main() {
  late SaveLocalPreferencesUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = SaveLocalPreferencesUseCase(
      Mocks.localPreferencesRepository,
    );
    when(() => Mocks.localPreferencesRepository.saveLocalPreferences(any())) //
        .thenAnswer((_) async => success(unit));
    when(() => Mocks.localPreferencesRepository.getLocalPreferences())
        .thenAnswer((_) async => success(Stubs.localPreferences));
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN

      // WHEN
      final result = await useCase.execute(
        prefsUpdater: (prefs) => prefs.copyWith(
          mainTab: MainTab.prompts,
        ),
      );
      verifyInOrder([
        () => Mocks.localPreferencesRepository.getLocalPreferences(),
        () => Mocks.localPreferencesRepository.saveLocalPreferences(any()),
      ]);
      // THEN
      expect(result.isSuccess, true);
    },
  );

  test('getIt resolves successfully', () async {
    final useCase = getIt<SaveLocalPreferencesUseCase>();
    expect(useCase, isNotNull);
  });
}
