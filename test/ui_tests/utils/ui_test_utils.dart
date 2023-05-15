import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:meta/meta.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recase/recase.dart';

import 'package:chatgpt_prompts/core/utils/platforms.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import '../../mocks/mocks.dart';
import 'ui_test_app.dart';

Future<void> prepareIntegrationTests() async {
  await getIt.reset();
  getIt.allowReassignment = true;
  Mocks.init();
  configureDependencies();
  Mock.throwOnMissingStub();
}

@isTest
void uiTest(
  String description, {
  required Widget Function() createPage,
  required FutureOr<void> Function(WidgetTester) prepare,
  required Future<void> Function(WidgetTester) test,
}) {
  testWidgets(
    description,
    (widgetTester) async {
      try {
        await loadAppFonts();
        Platforms.override = TargetPlatform.android;
        await prepare(widgetTester);
        await widgetTester.pumpWidget(
          UITestApp(child: createPage()),
        );
        await widgetTester.pumpAndSettle();
        await test(widgetTester);
      } catch (ex) {
        // in case of an error, take a screenshot
        try {
          final screenshotPath = await takeScreenshot(
            description.trim().snakeCase,
            tester: widgetTester,
            subDirectory: 'failures',
          );
          if (screenshotPath != null) {
            debugPrint(
              'UI test failed:'
              '\n"$description".'
              '\nYou can review screenshot of the UI at the moment of failure at: '
              '\n${Uri.file(screenshotPath)}\n\n',
            );
          }
        } catch (ex) {
          debugPrint('Failed to take a screenshot');
        }
        rethrow;
      }
    },
    tags: ['uiTest'],
  );
}

Future<String?> takeScreenshot(
  String name, {
  required WidgetTester tester,
  String? path,
  String? subDirectory,
}) async {
  final finder = find.byType(MaterialApp);
  var dir = getRootProjectDir();
  if (subDirectory != null) {
    dir = Directory(dir.path + Platform.pathSeparator + subDirectory);
  }
  final file = File('${dir.path}${Platform.pathSeparator}$name.png').absolute;
  if (tester.elementList(finder).isEmpty) {
    debugPrint(
      'Could not take a screenshot at:\n'
      '"$file"\n'
      'there is no MaterialApp widget in the widget tree, '
      'seems like test failed even before screen was pumped for the first time.\n\n'
      'See exception below\n\n',
    );
    return null;
  }
  final image = await captureImage(tester.firstElement(finder));

  final path = await TestWidgetsFlutterBinding.instance.runAsync(() async {
    await file.parent.create(recursive: true);
    final bytes = await image.toByteData(format: ImageByteFormat.png);
    await file.writeAsBytes(bytes!.buffer.asUint8List(), flush: true);
    return file.path;
  });
  return path;
}

Directory getRootProjectDir() => Directory.current.path.endsWith('${Platform.pathSeparator}test') //
    ? Directory.current.parent
    : Directory.current;

/// combines multiple finders into one. only widgets that match all finders are considered as a find
class AllOfFinder extends MatchFinder {
  final List<Finder> finders;

  AllOfFinder(this.finders);

  @override
  String get description => 'allOf: [\n\t${finders.map((e) => e.description).join('\n\t')}\n]';

  @override
  bool matches(Element candidate) {
    return finders.every((it) => it.evaluate().contains(candidate));
  }
}
