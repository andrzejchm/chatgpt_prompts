import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class GetLocalPreferencesFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const GetLocalPreferencesFailure.unknown([this.cause]) : type = GetLocalPreferencesFailureType.unknown;

  final GetLocalPreferencesFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case GetLocalPreferencesFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'GetLocalPreferencesFailure{type: $type, cause: $cause}';
}

enum GetLocalPreferencesFailureType {
  unknown,
}
