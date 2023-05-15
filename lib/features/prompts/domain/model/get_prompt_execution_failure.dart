import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class GetPromptExecutionFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const GetPromptExecutionFailure.unknown([this.cause]) : type = GetPromptExecutionFailureType.unknown;

  final GetPromptExecutionFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case GetPromptExecutionFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'GetPromptExecutionFailure{type: $type, cause: $cause}';
}

enum GetPromptExecutionFailureType {
  unknown,
}
