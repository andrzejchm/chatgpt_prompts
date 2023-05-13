import 'package:flutter_test/flutter_test.dart';

import '../../mocks/stubs.dart';

void main() {
  test('compileTemplate should substitute all variables with their values', () {
    final compiledTemplate = Stubs.promptExecutionRequest.compileTemplate();
    expect(
      compiledTemplate,
      '''
      create a greeting message to the user that said the following
       ```Hello```
      make the response with JSON format
      '''
          .trim(),
    );
  });

  test("compileTemplate should omit variables that don't exist in values", () {
    final compiledTemplate = Stubs.promptExecutionRequest //
        .copyWith(
          formData: Stubs.promptExecutionFormData.copyWith(
            variablesValues: {'greeting': 'Hello'},
          ),
        ) //
        .compileTemplate();

    expect(
      compiledTemplate,
      '''
      create a greeting message to the user that said the following
       ```Hello```
      make the response with {{format}} format
      '''
          .trim(),
    );
  });
}
