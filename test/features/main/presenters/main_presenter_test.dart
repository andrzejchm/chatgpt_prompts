import 'package:flutter_test/flutter_test.dart';
import 'package:chatgpt_prompts/features/main/main_initial_params.dart';
import 'package:chatgpt_prompts/features/main/main_presentation_model.dart';
import 'package:chatgpt_prompts/features/main/main_presenter.dart';

import '../mocks/main_mock_definitions.dart';

void main() {
  late MainPresentationModel model;
  late MainPresenter presenter;
  late MockMainNavigator navigator;


  setUp(() => prepareAppForUnitTests());

  test(
    'sample test',
        () {
      expect(presenter, isNotNull); // TODO implement this
    },
  );

  setUp(() {
    model = MainPresentationModel.initial(const MainInitialParams());
    navigator = MockMainNavigator();
    presenter = MainPresenter(
      model,
      navigator,
    );
  });
}
