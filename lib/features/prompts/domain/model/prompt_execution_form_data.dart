import 'package:equatable/equatable.dart';

class PromptExecutionFormData extends Equatable {
  const PromptExecutionFormData({
    required Map<String, String> variablesValues,
  }) : _variablesValues = variablesValues;

  const PromptExecutionFormData.empty() : _variablesValues = const {};

  final Map<String, String> _variablesValues;

  Map<String, String> get variablesValues => {..._variablesValues};

  @override
  List<Object?> get props => [
        _variablesValues,
      ];

  String? getVariableValue(
    String? variableSlug,
  ) =>
      variableSlug == null
          ? null //
          : _variablesValues[variableSlug];

  PromptExecutionFormData byUpdatingVariable({
    required String slug,
    required String value,
  }) =>
      copyWith(
        variablesValues: {..._variablesValues, slug: value},
      );

  PromptExecutionFormData copyWith({
    Map<String, String>? variablesValues,
  }) {
    return PromptExecutionFormData(
      variablesValues: variablesValues ?? _variablesValues,
    );
  }
}
