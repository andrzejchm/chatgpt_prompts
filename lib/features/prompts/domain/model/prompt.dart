import 'package:chatgpt_prompts/core/domain/model/id.dart';
import 'package:chatgpt_prompts/features/prompts/domain/model/prompt_template_variable.dart';
import 'package:equatable/equatable.dart';

//domain entity with name, id, and other fields, copyWith method and `empty()` named constructor
class Prompt extends Equatable {
  const Prompt({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAtUtc,
    required this.updatedAtUtc,
    required this.template,
    required this.variables,
  });

  const Prompt.empty()
      : id = const Id.empty(),
        name = '',
        description = '',
        createdAtUtc = '1970-01-01T00:00:00.000Z',
        template = '',
        variables = const [],
        updatedAtUtc = '1970-01-01T00:00:00.000Z';

  final Id id;
  final String name;
  final String description;
  final String createdAtUtc;
  final String updatedAtUtc;
  final String template;
  final List<PromptTemplateVariable> variables;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        createdAtUtc,
        updatedAtUtc,
        template,
        variables,
      ];

  //copyWith method
  Prompt copyWith({
    Id? id,
    String? name,
    String? description,
    String? createdAtUtc,
    String? updatedAtUtc,
    String? template,
    List<PromptTemplateVariable>? variables,
  }) {
    return Prompt(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      updatedAtUtc: updatedAtUtc ?? this.updatedAtUtc,
      template: template ?? this.template,
      variables: variables ?? this.variables,
    );
  }
}
