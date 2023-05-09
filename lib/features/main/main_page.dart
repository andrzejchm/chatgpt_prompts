// ignore: unused_import
import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/domain/model/main_tab.dart';
import 'package:chatgpt_prompts/core/utils/mvp_extensions.dart';
import 'package:chatgpt_prompts/features/chats/chat/chat_page.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:chatgpt_prompts/features/main/main_presenter.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_page.dart';
import 'package:chatgpt_prompts/features/settings/settings_page.dart';
import 'package:chatgpt_prompts/ui/widgets/app_navigation_rail.dart';
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
  void initState() {
    super.initState();
    presenter.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return stateObserver(
      builder: (context, state) {
        return Row(
          children: [
            AppNavigationRail(
              tabs: state.tabs,
              selectedTabIndex: state.selectedTabIndex,
              onTabSelected: (index) => presenter.onTabSelected(index),
            ),
            Expanded(
              child: IndexedStack(
                index: state.selectedTabIndex,
                children: state.tabs.map((it) {
                  switch (it) {
                    case MainTab.chat:
                      return ChatPage(presenter: state.chatPresenter);
                    case MainTab.prompts:
                      return PromptsPage(presenter: state.promptsPresenter);
                    case MainTab.settings:
                      return SettingsPage(presenter: state.settingsPresenter);
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
