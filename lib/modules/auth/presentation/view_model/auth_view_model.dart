import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:investapp/modules/auth/bloc/user/user_bloc.dart';
import 'package:investapp/modules/auth/domain/model/user_credentials.dart';

class AuthViewModel {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final ValueNotifier<bool> formIsValid = ValueNotifier<bool>(false);

  final UserBloc userBloc;

  AuthViewModel(this.userBloc) {
    email.addListener(() => formIsValid.value = _formIsValid());
    password.addListener(() => formIsValid.value = _formIsValid());
    userBloc.stream.listen((event) {

    });
  }

  bool _formIsValid() => email.value.text.isNotEmpty && password.text.isNotEmpty;

  Future<void> login() async {
   await userBloc.login(_getCredentials());
  }

  UserCredentials _getCredentials() {
    return UserCredentials(
      email: email.text,
      password: password.text,
    );
  }

  void showErrorAlert(UserErrorState error) {
    FlutterPlatformAlert.showAlert(
      windowTitle: "Ocorreu um erro ao realizar login",
      text: error.toString(),
      iconStyle: IconStyle.error,
      alertStyle: AlertButtonStyle.ok,
    );
  }
}