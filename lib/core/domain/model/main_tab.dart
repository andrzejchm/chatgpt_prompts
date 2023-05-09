enum MainTab {
  chat('chat'),
  prompts('prompts'),
  settings('settings');

  const MainTab(this.stringVal);

  final String stringVal;

  static MainTab fromString(String stringVal) {
    return MainTab.values.firstWhere(
      (it) => it.stringVal == stringVal,
      orElse: () => MainTab.chat,
    );
  }
}
