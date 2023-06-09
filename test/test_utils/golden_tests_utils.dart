// ignore_for_file: unused-code, unused-files

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:alchemist/alchemist.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:meta/meta.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'package:chatgpt_prompts/core/utils/durations.dart';
import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'golden_test_device_scenario.dart';
import 'test_utils.dart';

final testDevices = [
  Device.tabletLandscape.copyWith(name: 'PC'),
];

@isTest
Future<void> screenshotTest(
  String description, {
  String variantName = '',
  bool skip = false,
  FutureOr<void> Function()? setUp,
  required Widget Function() pageBuilder,
  List<String> tags = const ['golden'],
  List<Device>? devices,
  List<ThemeData>? themes,
  Duration timeout = const Duration(seconds: 5),
}) async {
  return preparePageTests(
    () => goldenTest(
      description,
      fileName: '$description${variantName.trim().isEmpty ? '' : '_$variantName'}',
      builder: () {
        setUp?.call();
        return GoldenTestGroup(
          children: (devices ?? testDevices) //
              .expand(
                (device) {
                  final themesList = themes ?? [appTheme.lightTheme, appTheme.darkTheme];
                  return themesList.map((theme) => MapEntry(theme, device));
                },
              )
              .map(
                (it) => DefaultAssetBundle(
                  bundle: TestAssetBundle(),
                  child: GoldenTestDeviceScenario(
                    device: it.value,
                    builder: () => Theme(
                      data: it.key,
                      child: pageBuilder(),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
      tags: tags,
      skip: skip,
      pumpBeforeTest: (tester) async {
        //first round of precaching for images that are available immediately
        await mockNetworkImages(() => precacheImages(tester));
        //this will allow all the UI to properly settle before caching images
        await tester.pump(const LongDuration());
        //second round of precaching for images that are available a bit later, after first frame
        return mockNetworkImages(() => precacheImages(tester)).timeout(timeout);
      },
      pumpWidget: (tester, widget) => mockNetworkImages(() => tester.pumpWidget(widget)).timeout(timeout),
    ).timeout(timeout),
  );
}

@isTest
Future<void> widgetScreenshotTest(
  String description, {
  String variantName = '',
  bool skip = false,
  FutureOr<void> Function()? setUp,
  required WidgetBuilder widgetBuilder,
  List<String> tags = const ['golden'],
  Duration timeout = const Duration(seconds: 5),
}) async {
  return goldenTest(
    description,
    fileName: '$description${variantName.trim().isEmpty ? '' : '_$variantName'}',
    builder: () {
      setUp?.call();

      return DefaultAssetBundle(
        bundle: TestAssetBundle(),
        child: Builder(builder: widgetBuilder),
      );
    },
    tags: tags,
    skip: skip,
    pumpBeforeTest: (tester) async {
      //first round of precaching for images that are available immediately
      await mockNetworkImages(() => precacheImages(tester));
      //this will allow all the UI to properly settle before caching images
      await tester.pump(const LongDuration());
      //second round of precaching for images that are available a bit later, after first frame
      return mockNetworkImages(() => precacheImages(tester)).timeout(timeout);
    },
    pumpWidget: (tester, widget) => mockNetworkImages(() => tester.pumpWidget(widget)).timeout(timeout),
  ).timeout(timeout);
}

/// small helper to add container around widget with some background in order to better understand widget's bounds
class TestWidgetContainer extends StatelessWidget {
  const TestWidgetContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.red),
      ),
      child: child,
    );
  }
}
