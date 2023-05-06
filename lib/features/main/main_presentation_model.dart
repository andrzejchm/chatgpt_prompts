import 'package:chatgpt_prompts/features/chats/chat/chat_presenter.dart';
import 'package:chatgpt_prompts/features/main/main_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class MainPresentationModel implements MainViewModel {
  /// Creates the initial state
  MainPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    MainInitialParams initialParams,
    this.chatPresenter,
  ) : selectedTab = MainTab.chat;

  /// Used for the copyWith method
  MainPresentationModel._(
    this.selectedTab,
    this.chatPresenter,
  );

  @override
  final ChatPresenter chatPresenter;

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
  }) {
    return MainPresentationModel._(
      selectedTab ?? this.selectedTab,
      chatPresenter ?? this.chatPresenter,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class MainViewModel {
  List<MainTab> get tabs;

  MainTab get selectedTab;

  int get selectedTabIndex;

  ChatPresenter get chatPresenter;
}

enum MainTab {
  chat,
  prompts,
  settings,
}
