import 'package:flutter/material.dart';

class UITestApp extends StatelessWidget {
  final Widget child;

  const UITestApp({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(
        size: Size(1024, 768),
      ),
      child: MaterialApp(
        home: child,
      ),
    );
  }
}
