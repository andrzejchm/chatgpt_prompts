import 'package:chatgpt_prompts/core/data/hive/adapters/completion_streamed_chunk_choice_type_adapter.dart';
import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk.dart';
import 'package:hive/hive.dart';

class CompletionStreamedChunkTypeAdapter extends TypeAdapter<CompletionStreamedChunk> {
  @override
  //ignore: no-magic-number
  int get typeId => 2;

  @override
  CompletionStreamedChunk read(BinaryReader reader) {
    return CompletionStreamedChunk(
      id: Id(reader.readString()),
      //ignore:prefer-moving-to-variable
      created: reader.readString(),
      choice: CompletionStreamedChunkChoiceTypeAdapter().read(reader),
      //ignore: prefer-moving-to-variable
      model: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, CompletionStreamedChunk obj) {
    writer.writeString(obj.id.value);
    writer.writeString(obj.created);
    CompletionStreamedChunkChoiceTypeAdapter().write(writer, obj.choice);
    writer.writeString(obj.model);
  }
}
