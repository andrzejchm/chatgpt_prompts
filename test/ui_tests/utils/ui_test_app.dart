import 'package:flutter/material.dart';

import 'package:chatgpt_prompts/chatgpt_prompts_app.dart';

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
      child: ChatgptPromptsApp(
        home: child,
      ),
    );
  }
}
