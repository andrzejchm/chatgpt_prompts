import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/prompts/prompt_details/prompt_details_page.dart';
import 'package:chatgpt_prompts/features/prompts/prompt_details/widgets/prompt_variable_input.dart';
import 'base/page_robot.dart';
import 'base/widget_robot.dart';

class PromptDetailsRobot extends PageRobot<PromptDetailsPage> {
  PromptDetailsRobot(super.tester);

  WidgetRobot get promptName => WidgetRobot(
        tester,
        childOfThisPage(
          matching: find.byKey(const ValueKey('prompt_details_header_title')),
        ),
      );

  WidgetRobot get promptDescription => WidgetRobot(
        tester,
        childOfThisPage(
          matching: find.byKey(const ValueKey('prompt_details_header_description')),
        ),
      );

  WidgetRobot variableTextField(String slug) => WidgetRobot(
        tester,
        childOfThisPage(
          matching: find.descendant(
            of: find.byWidgetPredicate(
              (widget) => widget is PromptVariableInput && widget.item.slug == slug,
            ),
            matching: find.byType(TextFormField),
          ),
        ),
      );
}
