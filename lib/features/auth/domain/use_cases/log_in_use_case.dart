import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:chatgpt_prompts/core/domain/model/user.dart';
import 'package:chatgpt_prompts/core/domain/stores/user_store.dart';
import 'package:chatgpt_prompts/core/utils/either_extensions.dart';
import 'package:chatgpt_prompts/features/auth/domain/model/log_in_failure.dart';
import 'package:chatgpt_prompts/main.dart';

class LogInUseCase {
  const LogInUseCase(this._userStore);

  final UserStore _userStore;

  Future<Either<LogInFailure, User>> execute({
    required String username,
    required String password,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      return failure(const LogInFailure.missingCredentials());
    }

    if (!isUnitTests) {
      //TODO simulation of network request
      //ignore: no-magic-number
      await Future.delayed(Duration(milliseconds: 500 + Random().nextInt(1000)));
    }

    if (username == 'test' && password == 'test123') {
      final user = User(
        id: 'id_$username',
        username: username,
      );
      _userStore.user = user;
      return success(
        user,
      );
    }
    return failure(const LogInFailure.unknown());
  }
}
