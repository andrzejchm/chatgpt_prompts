import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class SaveLocalPreferencesFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const SaveLocalPreferencesFailure.unknown([this.cause]) : type = SaveLocalPreferencesFailureType.unknown;

  final SaveLocalPreferencesFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case SaveLocalPreferencesFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'SaveLocalPreferencesFailure{type: $type, cause: $cause}';
}

enum SaveLocalPreferencesFailureType {
  unknown,
}
