import 'package:flutter_test/flutter_test.dart';

import 'package:chatgpt_prompts/features/prompts/prompts_list/widgets/prompts_list_item.dart';
import 'package:chatgpt_prompts/features/prompts/prompts_page.dart';
import 'base/page_robot.dart';
import 'base/widget_robot.dart';

class PromptsRobot extends PageRobot<PromptsPage> {
  PromptsRobot(super.tester);

  WidgetRobot promptListItemWithName(String name) => WidgetRobot(
        tester,
        childOfThisPage(
          matching: find.descendant(
            of: find.byType(PromptsListItem),
            matching: find.text(name),
          ),
        ),
      );
}
