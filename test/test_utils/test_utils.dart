import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:alchemist/alchemist.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chatgpt_prompts/core/helpers.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/core/utils/platforms.dart';
import 'package:chatgpt_prompts/dependency_injection/app_component.dart';
import 'package:chatgpt_prompts/localization/app_localizations_utils.dart';
import 'package:chatgpt_prompts/main.dart';
import '../mocks/mocks.dart';

Future<Either<F, S>> successFuture<F, S>(S result) => Future.value(success(result));

Future<Either<F, S>> failFuture<F, S>(F fail) => Future.value(failure(fail));

Future<void> prepareAppForUnitTests() async {
  isUnitTests = true;
  resetMocktailState();
  Mocks.init();
  Mock.throwOnMissingStub();
  notImplemented = ({message, context}) => doNothing();
  overrideAppLocalizations(AppLocalizationsEn());
  await configureDependenciesForTests();
}

Future<void> configureDependenciesForTests() async {
  await getIt.reset();
  getIt.allowReassignment = true;
  configureDependencies();
}

Future<void> preparePageTests(FutureOr<void> Function() testMain) async {
  overrideAppLocalizations(AppLocalizationsEn());
  //makes sure fonts are rendering in tests properly (android uses roboto font by default in material theme)
  Platforms.override = TargetPlatform.android;
  await loadAppFonts();
  await prepareAppForUnitTests();
  // ignore: do_not_use_environment
  const isCi = bool.fromEnvironment('isCI');

  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        // ignore: avoid_redundant_argument_values
        enabled: !isCi,
      ),
    ),
    run: () async {
      return testMain();
    },
  );
}
