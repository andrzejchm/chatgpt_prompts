import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_page.dart';
import 'base/page_robot.dart';
import 'base/widget_robot.dart';

class PromptDetailsRobot extends PageRobot<PromptDetailsPage> {
  PromptDetailsRobot(super.tester);

  WidgetRobot get title => WidgetRobot(
        tester,
        childOfThisPage(matching: find.byType(Text)),
      );
}
