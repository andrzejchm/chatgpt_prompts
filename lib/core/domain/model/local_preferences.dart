import 'package:chatgpt_prompts/core/domain/model/main_tab.dart';
import 'package:equatable/equatable.dart';

//copyWith method, empty() constructor, props. `mainTab` field
class LocalPreferences extends Equatable {
  const LocalPreferences({
    required this.mainTab,
  });

  const LocalPreferences.empty() : mainTab = MainTab.chat;

  final MainTab mainTab;

  @override
  List<Object?> get props => [
        mainTab,
      ];

  LocalPreferences copyWith({
    MainTab? mainTab,
  }) {
    return LocalPreferences(
      mainTab: mainTab ?? this.mainTab,
    );
  }
}
