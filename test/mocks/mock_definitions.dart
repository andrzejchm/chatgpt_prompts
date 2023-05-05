import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/domain/model/create_chat_completion_failure.dart';
import 'package:chatgpt_prompts/core/domain/model/user.dart';
import 'package:chatgpt_prompts/core/domain/repositories/openai_repository.dart';
import 'package:chatgpt_prompts/core/domain/stores/user_store.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/utils/current_time_provider.dart';
import 'package:chatgpt_prompts/core/utils/debouncer.dart';
import 'package:chatgpt_prompts/core/utils/periodic_task_executor.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';

//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

class MockAppNavigator extends Mock implements AppNavigator {}

//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES

class MockCreateChatCompletionFailure extends Mock implements CreateChatCompletionFailure {}

class MockCreateChatCompletionUseCase extends Mock implements CreateChatCompletionUseCase {}

//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES

class MockOpenaiRepository extends Mock implements OpenaiRepository {}
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
class MockUserStore extends MockCubit<User> implements UserStore {}
//DO-NOT-REMOVE STORES_MOCK_DEFINITION

class MockDebouncer extends Mock implements Debouncer {}

class MockPeriodicTaskExecutor extends Mock implements PeriodicTaskExecutor {}

class MockCurrentTimeProvider extends Mock implements CurrentTimeProvider {}
