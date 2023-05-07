import 'dart:io';

import 'package:flutter/foundation.dart';

class Platforms {
  const Platforms._();

  static bool get isDesktopPlatform => Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  static TargetPlatform get currentPlatform {
    if (kIsWeb) {
      return TargetPlatform.android;
    } else if (Platform.isMacOS) {
      return TargetPlatform.macOS;
    } else if (Platform.isWindows) {
      return TargetPlatform.windows;
    } else if (Platform.isLinux) {
      return TargetPlatform.linux;
    } else if (Platform.isIOS) {
      return TargetPlatform.iOS;
    } else if (Platform.isAndroid) {
      return TargetPlatform.android;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
