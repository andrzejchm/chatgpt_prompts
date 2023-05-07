import 'package:flutter_test/flutter_test.dart';

import '../../utils/ui_test_utils.dart' as test_utils;

abstract class PageRobot<PageType> {
  static const defaultTimeoutDuration = Duration(seconds: 2);

  final WidgetTester tester;

  const PageRobot(this.tester);

  /// returns a finder that matches only children of this page
  Finder childOfThisPage({required Finder matching}) {
    return find.descendant(of: find.byType(PageType), matching: matching);
  }

  void verifyPageVisible() {
    expect(find.byType(PageType), findsOneWidget);
  }

  Future<String?> takeScreenshot(
    String name, {
    String? path,
    String? subDirectory,
  }) async {
    return test_utils.takeScreenshot(
      name,
      path: path,
      tester: tester,
      subDirectory: subDirectory,
    );
  }
}
