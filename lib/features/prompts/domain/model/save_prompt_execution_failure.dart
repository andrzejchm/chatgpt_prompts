import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class SavePromptExecutionFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const SavePromptExecutionFailure.unknown([this.cause]) : type = SavePromptExecutionFailureType.unknown;

  final SavePromptExecutionFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case SavePromptExecutionFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'SavePromptExecutionFailure{type: $type, cause: $cause}';
}

enum SavePromptExecutionFailureType {
  unknown,
}
