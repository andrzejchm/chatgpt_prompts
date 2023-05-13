import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class SavePromptExecutionFormDataFailure implements HasDisplayableFailure {
  const SavePromptExecutionFormDataFailure.unknown([this.cause])
      // ignore: avoid_field_initializers_in_const_classes
      : type = SavePromptExecutionFormDataFailureType.unknown;

  final SavePromptExecutionFormDataFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case SavePromptExecutionFormDataFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'SavePromptExecutionFormDataFailure{type: $type, cause: $cause}';
}

enum SavePromptExecutionFormDataFailureType {
  unknown,
}
