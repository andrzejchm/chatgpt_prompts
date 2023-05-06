// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_page.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:chatgpt_prompts/features/main/main_presenter.dart';
import 'package:chatgpt_prompts/localization/app_localizations_utils.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget with HasPresenter<MainPresenter> {
  const MainPage({
    required this.presenter,
    super.key,
  });

  @override
  final MainPresenter presenter;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with PresenterStateMixin<MainViewModel, MainPresenter, MainPage> {
  @override
  Widget build(BuildContext context) {
    return stateObserver(
      builder: (context, state) {
        return Row(
          children: [
            NavigationRail(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              destinations: state.tabs.map((it) => it.toNavigationRailDestination(context)).toList(),
              labelType: NavigationRailLabelType.all,
              selectedIndex: state.selectedTabIndex,
              onDestinationSelected: (index) => presenter.onTabSelected(index),
            ),
            Expanded(
              child: IndexedStack(
                index: state.selectedTabIndex,
                children: state.tabs.map((it) {
                  switch (it) {
                    case MainTab.chat:
                      return ChatPage(presenter: state.chatPresenter);
                    case MainTab.prompts:
                      //todo
                      return ChatPage(presenter: state.chatPresenter);
                    case MainTab.settings:
                      //todo
                      return ChatPage(presenter: state.chatPresenter);
                  }
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

//extension on MainTab
extension MainTabExtension on MainTab {
  IconData get icon {
    switch (this) {
      case MainTab.chat:
        return Icons.chat;
      case MainTab.settings:
        return Icons.settings;
      case MainTab.prompts:
        return Icons.format_quote;
    }
  }

  String get title {
    switch (this) {
      case MainTab.chat:
        return appLocalizations.mainNavChat;
      case MainTab.settings:
        return appLocalizations.mainNavSettings;
      case MainTab.prompts:
        return appLocalizations.mainNavPrompts;
    }
  }

  NavigationRailDestination toNavigationRailDestination(BuildContext context) => NavigationRailDestination(
        icon: Icon(icon),
        label: Text(title),
        selectedIcon: Icon(icon, color: colors(context).onBackground),
      );
}
