import 'package:equatable/equatable.dart';

class Id extends Equatable {
  const Id(this.value);

  const Id.empty() : value = '';

  final String value;

  @override
  List<Object?> get props => [
        value,
      ];
}
