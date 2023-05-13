import 'package:chatgpt_prompts/core/domain/model/displayable_failure.dart';

class ReadHiveObjectFailure implements HasDisplayableFailure {
  // ignore: avoid_field_initializers_in_const_classes
  const ReadHiveObjectFailure.unknown([this.cause]) : type = ReadHiveObjectFailureType.unknown;

  final ReadHiveObjectFailureType type;
  final Object? cause;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case ReadHiveObjectFailureType.unknown:
        return DisplayableFailure.commonError(this);
    }
  }

  @override
  String toString() => 'ReadHiveObjectFailure{type: $type, cause: $cause}';
}

enum ReadHiveObjectFailureType {
  unknown,
}
