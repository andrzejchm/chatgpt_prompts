import 'dart:async';

import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/core/utils/logging.dart';
import 'package:dartz/dartz.dart';

extension ToEitherTransformer<OrgData> on Stream<OrgData> {
  Stream<Either<Fail, MappedData>> toEither<Fail, MappedData>({
    required Fail Function(
      Object error,
      StackTrace stackTrace,
    )
        mapError,
    MappedData Function(OrgData data)? mapData,
  }) =>
      transform(toEitherTransformer<Fail, OrgData, MappedData>(mapError: mapError, mapData: mapData));
}

StreamTransformer<OrgData, Either<Fail, MappedData>> toEitherTransformer<Fail, OrgData, MappedData>({
  required Fail Function(
    Object error,
    StackTrace stackTrace,
  )
      mapError,
  MappedData Function(OrgData data)? mapData,
}) =>
    StreamTransformer.fromHandlers(
      handleError: (
        err,
        stack,
        sink,
      ) {
        logError(err, stack);
        sink.add(failure(mapError(err, stack)));
        sink.close();
      },
      handleData: (data, sink) {
        final mappedData = mapData == null ? data : mapData(data);
        sink.add(success(mappedData as MappedData));
      },
    );
