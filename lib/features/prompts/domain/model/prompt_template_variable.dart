import 'package:equatable/equatable.dart';

//domain entity with slug, position, and other fields, copyWith method and `empty` constructor
class PromptTemplateVariable extends Equatable {
  const PromptTemplateVariable({
    required this.slug,
    required this.position,
    required this.description,
  });

  const PromptTemplateVariable.empty()
      : slug = '',
        description = '',
        position = 0;

  final String slug;
  final int position;
  final String description;

  @override
  List<Object?> get props => [
        slug,
        position,
        description,
      ];

  //copyWith method
  PromptTemplateVariable copyWith({
    String? slug,
    int? position,
    String? description,
  }) {
    return PromptTemplateVariable(
      slug: slug ?? this.slug,
      position: position ?? this.position,
      description: description ?? this.description,
    );
  }
}
