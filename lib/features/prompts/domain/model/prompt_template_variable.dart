import 'package:equatable/equatable.dart';

//domain entity with slug, position, and other fields, copyWith method and `empty` constructor
class PromptTemplateVariable extends Equatable {
  const PromptTemplateVariable({
    required this.slug,
    required this.description,
  });

  const PromptTemplateVariable.empty()
      : slug = '',
        description = '';

  final String slug;
  final String description;

  @override
  List<Object?> get props => [
        slug,
        description,
      ];

  //copyWith method
  PromptTemplateVariable copyWith({
    String? slug,
    String? description,
  }) {
    return PromptTemplateVariable(
      slug: slug ?? this.slug,
      description: description ?? this.description,
    );
  }
}
