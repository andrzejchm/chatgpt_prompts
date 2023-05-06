import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:chatgpt_prompts/localization/app_localizations_utils.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppNavigationRail extends StatelessWidget {
  const AppNavigationRail({
    super.key,
    required this.tabs,
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  final List<MainTab> tabs;
  final int selectedTabIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      destinations: tabs.map((it) => it.toNavigationRailDestination(context)).toList(),
      labelType: NavigationRailLabelType.all,
      selectedIndex: selectedTabIndex,
      onDestinationSelected: onTabSelected,
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
