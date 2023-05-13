import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class SaveHiveObjectFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const SaveHiveObjectFailure.unknown([this.cause]) : type = SaveHiveObjectFailureType.unknown;

  final SaveHiveObjectFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case SaveHiveObjectFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'SaveHiveObjectFailure{type: $type, cause: $cause}';
}

enum SaveHiveObjectFailureType {
  unknown,
}
