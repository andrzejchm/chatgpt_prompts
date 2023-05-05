import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class CreateChatCompletionFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const CreateChatCompletionFailure.unknown([this.cause]) : type = CreateChatCompletionFailureType.unknown;

  final CreateChatCompletionFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case CreateChatCompletionFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'CreateChatCompletionFailure{type: $type, cause: $cause}';
}

enum CreateChatCompletionFailureType {
  unknown,
}
