import 'package:equatable/equatable.dart';

class Config extends Equatable {
  //openApiKey
  const Config({
    required this.openApiKey,
  });

  final String openApiKey;

  @override
  List<Object?> get props => [
        openApiKey,
      ];

  Config copyWith({
    String? openApiKey,
  }) {
    return Config(
      openApiKey: openApiKey ?? this.openApiKey,
    );
  }
}
