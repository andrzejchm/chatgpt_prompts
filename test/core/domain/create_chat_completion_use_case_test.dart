import 'package:dart_openai/openai.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import '../../mocks/mocks.dart';
import '../../test_utils/test_utils.dart';

void main() {
  late CreateChatCompletionUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = CreateChatCompletionUseCase(
      Mocks.openaiRepository,
    );
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN
      when(() => Mocks.openaiRepository.createChatCompletion(inputs: any(named: 'inputs')))
          .thenAnswer((_) async => success(MockOpenAIChatCompletionModel()));
      // WHEN
      final result = await useCase.execute(
        inputs: [],
      );

      // THEN
      expect(result.isSuccess, true);
    },
  );

  test('getIt resolves successfully', () async {
    final useCase = getIt<CreateChatCompletionUseCase>();
    expect(useCase, isNotNull);
  });
}

//ignore: avoid_implementing_value_types
class MockOpenAIChatCompletionModel extends Mock implements OpenAIChatCompletionModel {}
