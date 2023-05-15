import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/data/hive/hive_client.dart';
import 'package:chatgpt_prompts/core/data/openai/open_ai_client.dart';
import 'package:chatgpt_prompts/core/domain/model/create_chat_completion_failure.dart';
import 'package:chatgpt_prompts/core/domain/model/get_local_preferences_failure.dart';
import 'package:chatgpt_prompts/core/domain/model/save_local_preferences_failure.dart';
import 'package:chatgpt_prompts/core/domain/model/user.dart';
import 'package:chatgpt_prompts/core/domain/providers/config_provider.dart';
import 'package:chatgpt_prompts/core/domain/repositories/local_preferences_repository.dart';
import 'package:chatgpt_prompts/core/domain/stores/user_store.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/create_chat_completion_use_case.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/get_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/domain/use_cases/save_local_preferences_use_case.dart';
import 'package:chatgpt_prompts/core/utils/current_time_provider.dart';
import 'package:chatgpt_prompts/core/utils/debouncer.dart';
import 'package:chatgpt_prompts/core/utils/periodic_task_executor.dart';
import 'package:chatgpt_prompts/features/chats/domain/repositories/chats_repository.dart';
import 'package:chatgpt_prompts/navigation/app_navigator.dart';

//DO-NOT-REMOVE IMPORTS_MOCK_DEFINITIONS

class MockAppNavigator extends Mock implements AppNavigator {}

//DO-NOT-REMOVE MVP_MOCK_DEFINITION

// USE CASES

class MockCreateChatCompletionFailure extends Mock implements CreateChatCompletionFailure {}

class MockCreateChatCompletionUseCase extends Mock implements CreateChatCompletionUseCase {}

class MockGetLocalPreferencesFailure extends Mock implements GetLocalPreferencesFailure {}

class MockGetLocalPreferencesUseCase extends Mock implements GetLocalPreferencesUseCase {}

class MockSaveLocalPreferencesFailure extends Mock implements SaveLocalPreferencesFailure {}

class MockSaveLocalPreferencesUseCase extends Mock implements SaveLocalPreferencesUseCase {}

//DO-NOT-REMOVE USE_CASE_MOCK_DEFINITION

// REPOSITORIES

class MockChatsRepository extends Mock implements ChatsRepository {}

class MockLocalPreferencesRepository extends Mock implements LocalPreferencesRepository {}
//DO-NOT-REMOVE REPOSITORIES_MOCK_DEFINITION

// STORES
class MockUserStore extends MockCubit<User> implements UserStore {}
//DO-NOT-REMOVE STORES_MOCK_DEFINITION

class MockDebouncer extends Mock implements Debouncer {}

class MockPeriodicTaskExecutor extends Mock implements PeriodicTaskExecutor {}

class MockCurrentTimeProvider extends Mock implements CurrentTimeProvider {}

class MockConfigProvider extends Mock implements ConfigProvider {}

class MockHiveClient extends Mock implements HiveClient {}

class MockOpenAIClient extends Mock implements OpenAIClient {}
