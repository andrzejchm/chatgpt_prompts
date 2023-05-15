import 'dart:async';

import 'package:chatgpt_prompts/core/domain/model/future_result.dart';
import 'package:chatgpt_prompts/core/domain/model/stream_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocExtensions<T> on BlocBase<T> {
  void tryEmit(T state) {
    if (!isClosed) {
      // ignore: ban-name, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      emit(state);
    }
  }
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

extension AsObservableStream<T> on Stream<T> {
  void observeStatusChanges({
    void Function(StreamResult<T>)? onStatusChange,
    void Function(T)? onEmit,
    void Function()? onDone,
    required void Function(StreamSubscription<T>) onSubscribed,
  }) {
    // subscription should be handled in `onSubscribed` and properly disposed on call site.
    //ignore: cancel_subscriptions
    final subscription = listen(
      (value) {
        onStatusChange?.call(
          //ignore: prefer-trailing-comma
          StreamResult(value, StreamStatus.emission, null),
        );
        onEmit?.call(value);
      },
      onError: (error) {
        onStatusChange?.call(
          //ignore: prefer-trailing-comma
          StreamResult(null, StreamStatus.rejected, error),
        );

        throw error as Object;
      },
      onDone: () {
        onStatusChange?.call(
          //ignore: prefer-trailing-comma
          const StreamResult(null, StreamStatus.finished, null),
        );
        onDone?.call();
      },
    );
    onSubscribed(subscription);
    onStatusChange?.call(
      //ignore: prefer-trailing-comma
      const StreamResult(null, StreamStatus.pendingFirstEmission, null),
    );
  }
}
