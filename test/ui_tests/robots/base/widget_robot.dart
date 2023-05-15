import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../utils/ui_test_utils.dart';
import 'page_robot.dart';

class WidgetRobot {
  final WidgetTester tester;
  final Finder finder;

  const WidgetRobot(this.tester, this.finder);

  Future<void> tap() => tester.performUIAction(() async {
        await tester.tap(finder);
      });

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

  Future<void> hasDisplayedText(String text) async {
    await waitUntilVisible();
    final widgets = AllOfFinder([
      finder,
      find.text(text),
    ]).evaluate();
    if (widgets.length != 1) {
      throw "Expected to find exactly one widget with text '$text', but found ${widgets.length}";
    }
  }

  Future<void> hasInputText(String text) async {
    final stack = StackTrace.current;
    await waitUntilVisible();
    try {
      final widgets = find
          .byWidgetPredicate(
            (widget) => widget is TextFormField && widget.controller?.text == text,
            description: "TextField filled with '$text'",
          )
          .evaluate();
      if (widgets.length != 1) {
        throw "Expected to find exactly one TextFormField with text '$text', but found ${widgets.length}";
      }
    } catch (_) {
      debugPrint('Exception in $hasInputText at: \n$stack');
      rethrow;
    }
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
      await tester.runAsync(() => Future.value());
      await tester.pumpAndSettle();
    }
    if (finder.evaluate().isEmpty) {
      throw Exception('Widget is not visible: ${finder.description}');
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

  Future<void> typeText(String text) => tester.performUIAction(
        () async {
          await tap();
          return tester.enterText(finder, text);
        },
      );
}

extension WidgetTesterPerformUIAction on WidgetTester {
//performUIAction method
  Future<void> performUIAction(Future<void> Function() action) async {
    await action();
    await pumpAndSettle();
    // this makes sure all bloc emissions actually happen
    await runAsync(() => Future.value());
  }
}
