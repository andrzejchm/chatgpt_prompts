import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class GetPromptsListFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const GetPromptsListFailure.unknown([this.cause]) : type = GetPromptsListFailureType.unknown;

  final GetPromptsListFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case GetPromptsListFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'GetPromptsListFailure{type: $type, cause: $cause}';
}

enum GetPromptsListFailureType {
  unknown,
}
