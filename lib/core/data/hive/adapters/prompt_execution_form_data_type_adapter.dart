import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_execution_form_data.dart';
import 'package:hive/hive.dart';

class PromptExecutionFormDataTypeAdapter extends TypeAdapter<PromptExecutionFormData> {
  @override
  int get typeId => 1;

  @override
  PromptExecutionFormData read(BinaryReader reader) {
    return PromptExecutionFormData(
      variablesValues: reader.readMap().cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PromptExecutionFormData obj) {
    writer.writeMap(obj.variablesValues);
  }
}
