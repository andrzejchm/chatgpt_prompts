import 'package:equatable/equatable.dart';

//domain entity with slug, position, and other fields, copyWith method and `empty` constructor
class PromptTemplateVariable extends Equatable {
  const PromptTemplateVariable({
    required this.slug,
    required this.position,
  });

  const PromptTemplateVariable.empty()
      : slug = '',
        position = 0;

  final String slug;
  final int position;

  @override
  List<Object?> get props => [
        slug,
        position,
      ];

  //copyWith method
  PromptTemplateVariable copyWith({
    String? slug,
    int? position,
  }) {
    return PromptTemplateVariable(
      slug: slug ?? this.slug,
      position: position ?? this.position,
    );
  }
}
