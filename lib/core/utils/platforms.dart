import 'dart:io';

class Platforms {
  const Platforms._();

  static bool get isDesktopPlatform => Platform.isMacOS || Platform.isWindows || Platform.isLinux;
}
