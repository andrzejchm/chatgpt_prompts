import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/core/domain/model/user.dart';

class UserStore extends Cubit<User> {
  UserStore({User? user}) : super(user ?? const User.anonymous());

  User get user => state;

  set user(User user) {
    emit(user);
  }
}
