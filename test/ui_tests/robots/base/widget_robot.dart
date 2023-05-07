import 'package:flutter_test/flutter_test.dart';

import '../../utils/ui_test_utils.dart';
import 'page_robot.dart';

class WidgetRobot {
  final WidgetTester tester;
  final Finder finder;

  const WidgetRobot(this.tester, this.finder);

  Future<void> tap() async {
    await tester.tap(finder);
    await tester.pumpAndSettle();
    // this makes sure all bloc emissions actually happen
    await tester.runAsync(() => Future.value());
  }

  Future<void> isVisible({
    bool waitUntilVisible = true,
    Duration timeout = PageRobot.defaultTimeoutDuration,
  }) async {
    if (waitUntilVisible) {
      await this.waitUntilVisible(timeout: timeout);
    }
    expect(
      finder,
      findsOneWidget,
      reason: 'Widget is not visible: ${finder.description}',
    );
  }

  Future<void> hasText(String text) async {
    await waitUntilVisible();
    expect(
      AllOfFinder([
        finder,
        find.text(text),
      ]),
      findsOneWidget,
    );
  }

  Future<void> isNotVisible({bool waitUntilInvisible = true}) async {
    if (waitUntilInvisible) {
      await this.waitUntilInvisible();
    }
    expect(
      finder,
      findsNothing,
      reason: 'Widget is still visible: ${finder.description}',
    );
  }

  Future<void> waitUntilVisible({
    Duration timeout = PageRobot.defaultTimeoutDuration,
  }) async {
    final start = DateTime.now();
    while (finder.evaluate().isEmpty && DateTime.now().difference(start) < timeout) {
      await tester.pumpAndSettle();
      await tester.runAsync(() => Future.value());
    }
    await tester.pumpAndSettle();
  }

  Future<void> waitUntilInvisible({
    Duration timeout = PageRobot.defaultTimeoutDuration,
  }) async {
    final start = DateTime.now();
    while (finder.evaluate().isNotEmpty && DateTime.now().difference(start) < timeout) {
      await tester.pumpAndSettle();
    }
    await tester.pumpAndSettle();
  }
}
