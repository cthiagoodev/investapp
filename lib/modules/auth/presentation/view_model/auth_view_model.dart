import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:investapp/modules/auth/bloc/login/login_bloc.dart';
import 'package:investapp/modules/auth/bloc/user/user_bloc.dart';
import 'package:investapp/modules/auth/domain/model/user_credentials.dart';

final class AuthViewModel {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final ValueNotifier<bool> formIsValid = ValueNotifier<bool>(false);

  final LoginCubit loginCubit;
  final UserCubit userCubit;

  AuthViewModel(this.loginCubit, this.userCubit) {
    email.addListener(() => formIsValid.value = _formIsValid());
    password.addListener(() => formIsValid.value = _formIsValid());
  }

  bool _formIsValid() => email.value.text.isNotEmpty && password.text.isNotEmpty;

  void login() {
    loginCubit.onLoginSubmitted(_getCredentials());
  }

  UserCredentials _getCredentials() {
    return UserCredentials(
      email: email.text,
      password: password.text,
    );
  }

  void showErrorAlert(LoginErrorState error) {
    FlutterPlatformAlert.showAlert(
      windowTitle: "Ocorreu um erro ao realizar login",
      text: error.error.toString(),
      iconStyle: IconStyle.error,
      alertStyle: AlertButtonStyle.ok,
    );
  }
}