import 'package:chatgpt_prompts/features/prompts/domain/model/completion_streamed_chunk_choice.dart';
import 'package:hive/hive.dart';

class CompletionStreamedChunkChoiceTypeAdapter extends TypeAdapter<CompletionStreamedChunkChoice> {
  @override
  //ignore: no-magic-number
  int get typeId => 3;

  @override
  CompletionStreamedChunkChoice read(BinaryReader reader) {
    return CompletionStreamedChunkChoice(
      //ignore: prefer-moving-to-variable
      text: reader.readString(),
      index: reader.readInt(),
      //ignore: prefer-moving-to-variable
      finishReason: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, CompletionStreamedChunkChoice obj) {
    writer.writeString(obj.text);
    writer.writeInt(obj.index);
    writer.writeString(obj.finishReason);
  }
}
