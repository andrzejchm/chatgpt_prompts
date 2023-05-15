import 'package:chatgpt_prompts/core/data/hive/adapters/completion_streamed_chunk_choice_type_adapter.dart';
import 'package:chatgpt_prompts/core/data/hive/adapters/completion_streamed_chunk_type_adapter.dart';
import 'package:chatgpt_prompts/core/data/hive/adapters/prompt_execution_form_data_type_adapter.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk_choice.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:hive/hive.dart';

void hiveTypeAdapters() {
  Hive.registerAdapter<PromptExecutionFormData>(
    PromptExecutionFormDataTypeAdapter(),
  );
  Hive.registerAdapter<CompletionStreamedChunk>(
    CompletionStreamedChunkTypeAdapter(),
  );
  Hive.registerAdapter<CompletionStreamedChunkChoice>(
    CompletionStreamedChunkChoiceTypeAdapter(),
  );
}
