import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/domain/model/chat_completion_result.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import '../../features/chats/mocks/chats_mocks.dart';
import '../../test_utils/test_utils.dart';

void main() {
  late CreateChatCompletionUseCase useCase;

  setUp(() {
    prepareAppForUnitTests();
    useCase = CreateChatCompletionUseCase(
      ChatsMocks.chatsRepository,
    );
  });

  test(
    'use case executes normally',
    () async {
      // GIVEN
      when(() => ChatsMocks.chatsRepository.createChatCompletion(inputs: any(named: 'inputs')))
          .thenAnswer((_) async => success(const ChatCompletionResult.empty()));
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
