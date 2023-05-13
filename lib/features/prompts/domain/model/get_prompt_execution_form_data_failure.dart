import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class GetPromptExecutionFormDataFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const GetPromptExecutionFormDataFailure.unknown([this.cause]) : type = GetPromptExecutionFormDataFailureType.unknown;

  final GetPromptExecutionFormDataFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case GetPromptExecutionFormDataFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'GetPromptExecutionFormDataFailure{type: $type, cause: $cause}';
}

enum GetPromptExecutionFormDataFailureType {
  unknown,
}
