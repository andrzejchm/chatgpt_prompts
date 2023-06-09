import 'package:bloc/bloc.dart';
import 'package:chatgpt_prompts/features/auth/login/login_navigator.dart';
import 'package:chatgpt_prompts/features/auth/login/login_presentation_model.dart';

class LoginPresenter extends Cubit<LoginViewModel> {
  LoginPresenter(
    LoginPresentationModel super.model,
    this.navigator,
  );

  final LoginNavigator navigator;

  // ignore: unused_element
  LoginPresentationModel get _model => state as LoginPresentationModel;
}
