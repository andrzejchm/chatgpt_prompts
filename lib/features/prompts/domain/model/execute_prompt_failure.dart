import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class ExecutePromptFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const ExecutePromptFailure.unknown([this.cause]) : type = ExecutePromptFailureType.unknown;

  final ExecutePromptFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case ExecutePromptFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'ExecutePromptFailure{type: $type, cause: $cause}';
}

enum ExecutePromptFailureType {
  unknown,
}
