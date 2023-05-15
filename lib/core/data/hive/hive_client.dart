import 'dart:async';

import 'package:chatgpt_prompts/core/data/hive/hive_type_adapters.dart';
import 'package:chatgpt_prompts/core/data/hive/model/read_hive_object_failure.dart';
import 'package:chatgpt_prompts/core/data/hive/model/save_hive_object_failure.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveClient {
  const HiveClient({
    this.initPath,
  });

  /// convenient to set the path if the client is initialized in tests
  final String? initPath;

  static Completer<void>? _initializationCompleter;

  Future<Either<SaveHiveObjectFailure, Unit>> saveObject<T>({
    required HiveBoxId boxId,
    required String objectKey,
    required T object,
  }) async {
    try {
      await initialize();
      final isBoxOpen = Hive.isBoxOpen(boxId.stringName);
      final box = isBoxOpen ? Hive.lazyBox<T>(boxId.stringName) : await Hive.openLazyBox<T>(boxId.stringName);
      await box.put(objectKey, object);
      return success(unit);
    } catch (ex, stack) {
      logError(ex, stack);
      return failure(SaveHiveObjectFailure.unknown(ex));
    }
  }

  Future<Either<ReadHiveObjectFailure, T?>> readObject<T>({
    required HiveBoxId boxId,
    required String objectKey,
  }) async {
    try {
      await initialize();
      final isBoxOpen = Hive.isBoxOpen(boxId.stringName);
      final box = isBoxOpen ? Hive.lazyBox<T>(boxId.stringName) : await Hive.openLazyBox<T>(boxId.stringName);
      final object = await box.get(objectKey);
      return success(object);
    } catch (ex, stack) {
      logError(ex, stack);
      return failure(ReadHiveObjectFailure.unknown(ex));
    }
  }

  @visibleForTesting
  Future<void> initialize() async {
    var completer = _initializationCompleter;
    if (completer == null) {
      _initializationCompleter = completer = Completer();
      if (initPath == null) {
        debugLog('Initializing Hive with initFlutter');
        await Hive.initFlutter();
      } else {
        debugLog('Initializing Hive at $initPath');
        Hive.init(initPath);
      }
      hiveTypeAdapters();
      _initializationCompleter?.complete();
    }
    return completer.future;
  }
}

enum HiveBoxId {
  promptExecutionFormData('prompt_execution_form_data'),
  completionStreamedChunk('completion_streamed_chunk'),
  prompts('prompts');

  const HiveBoxId(this.stringName);

  final String stringName;
}
