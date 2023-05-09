import 'package:equatable/equatable.dart';

class FutureResult<T> extends Equatable {
  const FutureResult(
    this.result,
    this.status,
    this.error,
  );

  const FutureResult.empty()
      : result = null,
        error = null,
        status = FutureStatus.notStarted;

  const FutureResult.pending()
      : result = null,
        error = null,
        status = FutureStatus.pending;

  final T? result;
  final FutureStatus status;
  final dynamic error;

  @override
  List<Object?> get props => [
        result,
        status,
        error,
      ];

  bool isPending() => status == FutureStatus.pending;
}

enum FutureStatus {
  notStarted,
  pending,
  fulfilled,
  rejected,
}
