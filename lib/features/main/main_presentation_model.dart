import 'package:chatgpt_prompts/core/domain/model/main_tab.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_presenter.dart';
import 'package:chatgpt_prompts/features/main/main_initial_params.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_presenter.dart';
import 'package:chatgpt_prompts/features/settings/settings_presenter.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class MainPresentationModel implements MainViewModel {
  /// Creates the initial state
  MainPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    MainInitialParams initialParams,
    this.chatPresenter,
    this.settingsPresenter,
    this.promptsPresenter,
  ) : selectedTab = MainTab.chat;

  /// Used for the copyWith method
  MainPresentationModel._({
    required this.selectedTab,
    required this.chatPresenter,
    required this.settingsPresenter,
    required this.promptsPresenter,
  });

  @override
  final ChatPresenter chatPresenter;
  @override
  final SettingsPresenter settingsPresenter;
  @override
  final PromptsPresenter promptsPresenter;

  @override
  final MainTab selectedTab;

  @override
  List<MainTab> get tabs => [
        MainTab.chat,
        MainTab.prompts,
        MainTab.settings,
      ];

  @override
  int get selectedTabIndex => tabs.indexOf(selectedTab);

  //copyWith
  MainPresentationModel copyWith({
    MainTab? selectedTab,
    ChatPresenter? chatPresenter,
    SettingsPresenter? settingsPresenter,
    PromptsPresenter? promptsPresenter,
  }) {
    return MainPresentationModel._(
      selectedTab: selectedTab ?? this.selectedTab,
      chatPresenter: chatPresenter ?? this.chatPresenter,
      settingsPresenter: settingsPresenter ?? this.settingsPresenter,
      promptsPresenter: promptsPresenter ?? this.promptsPresenter,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class MainViewModel {
  List<MainTab> get tabs;

  MainTab get selectedTab;

  int get selectedTabIndex;

  ChatPresenter get chatPresenter;

  SettingsPresenter get settingsPresenter;

  PromptsPresenter get promptsPresenter;
}
