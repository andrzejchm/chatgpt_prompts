import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//ignore:prefer-match-file-name
enum FutureStatus {
  notStarted,
  pending,
  fulfilled,
  rejected,
}

extension BlocExtensions<T> on BlocBase<T> {
  void tryEmit(T state) {
    if (!isClosed) {
      // ignore: ban-name, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      emit(state);
    }
  }
}

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

extension AsObservableFuture<T> on Future<T> {
  Future<T> observeStatusChanges(void Function(FutureResult<T>) onChange) {
    onChange(
      //ignore: prefer-trailing-comma
      const FutureResult(null, FutureStatus.pending, null),
    );

    return then((value) {
      onChange(
        //ignore: prefer-trailing-comma
        FutureResult(value, FutureStatus.fulfilled, null),
      );

      return value;
    }).catchError((error) {
      onChange(
        //ignore: prefer-trailing-comma
        FutureResult(null, FutureStatus.rejected, error),
      );

      throw error as Object;
    });
  }
}
