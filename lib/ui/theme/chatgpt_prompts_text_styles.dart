//ignore_for_file: no-magic-number
import 'package:flutter/material.dart';

class ChatgptPromptsTextStyles {
  const ChatgptPromptsTextStyles({
    required this.caption,
    required this.body1,
  });

  ChatgptPromptsTextStyles.defaultStyle()
      : caption = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        body1 = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        );

  final TextStyle caption;
  final TextStyle body1;
}
