import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:investapp/modules/auth/bloc/login/login_bloc.dart';

class LoginViewModel {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final ValueNotifier<bool> formIsValid = ValueNotifier<bool>(false);

  final LoginBloc loginBloc;

  LoginViewModel(this.loginBloc) {
    email.addListener(() => formIsValid.value = _formIsValid());
    password.addListener(() => formIsVlid.value = _formIsValid());
  }

  bool _formIsValid() => email.value.text.isNotEmpty && password.text.isNotEmpty;

  void login() {
    loginBloc.add(LoginSubmittedEvent(email.text, password.text));
  }

  void showErrorAlert(LoginErrorState error) {
    FlutterPlatformAlert.showAlert(
      windowTitle: "Ocorreu um erro ao realizar login",
      text: error.toString(),
      iconStyle: IconStyle.error,
      alertStyle: AlertButtonStyle.ok,
    );
  }
}