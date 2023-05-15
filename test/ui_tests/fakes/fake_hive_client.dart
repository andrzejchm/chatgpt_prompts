import 'package:dartz/dartz.dart';

import 'package:chatgpt_prompts/core/data/hive/hive_client.dart';
import 'package:chatgpt_prompts/core/data/hive/model/read_hive_object_failure.dart';
import 'package:chatgpt_prompts/core/data/hive/model/save_hive_object_failure.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';

class FakeHiveClient implements HiveClient {
  FakeHiveClient();

  Map<HiveBoxId, Map<String, dynamic>> boxes = {};

  @override
  String? get initPath => '.';

  @override
  Future<void> initialize() async {}

  @override
  Future<Either<ReadHiveObjectFailure, T?>> readObject<T>({
    required HiveBoxId boxId,
    required String objectKey,
  }) async {
    final box = boxes[boxId];
    if (box == null) {
      return success(null);
    }
    final object = box[objectKey];
    return success(object as T?);
  }

  @override
  Future<Either<SaveHiveObjectFailure, Unit>> saveObject<T>({
    required HiveBoxId boxId,
    required String objectKey,
    required T object,
  }) async {
    final box = boxes[boxId];
    if (box == null) {
      boxes[boxId] = {objectKey: object};
    } else {
      box[objectKey] = object;
    }
    return success(unit);
  }
}
