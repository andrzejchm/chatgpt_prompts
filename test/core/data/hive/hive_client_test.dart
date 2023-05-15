import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:chatgpt_prompts/core/data/hive/hive_client.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import '../../../mocks/stubs.dart';

void main() {
  const hivePath = 'test/core/data/hive/hive_test_data';
  late HiveClient hiveClient;
  setUpAll(
    () => hiveClient = const HiveClient(initPath: hivePath),
  );

  tearDownAll(
    () => Hive.deleteFromDisk(),
  );

  test('hive client should initialize successfully', () async {
    await hiveClient.initialize();
  });

  testTypeAdapter(
    client: () => hiveClient,
    object: () => Stubs.promptExecutionFormData,
    boxId: HiveBoxId.promptExecutionFormData,
  );

  testTypeAdapter(
    client: () => hiveClient,
    object: () => Stubs.completionStreamedChunk,
    boxId: HiveBoxId.completionStreamedChunk,
  );
}

@isTest
void testTypeAdapter<T>({
  required HiveClient Function() client,
  required T Function() object,
  required HiveBoxId boxId,
}) =>
    test('should read and write $T to ${boxId.name}', () async {
      final saveResult = await client().saveObject<T>(
        boxId: boxId,
        objectKey: '123',
        object: object(),
      );
      expect(saveResult.isSuccess, true);

      final readResult = await client().readObject<T>(
        boxId: boxId,
        objectKey: '123',
      );
      expect(readResult.isSuccess, true);

      expect(readResult.getSuccess(), object());
    });
