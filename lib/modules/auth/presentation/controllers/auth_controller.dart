import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:investapp/modules/user/user.dart';

final class AuthController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final ValueNotifier<bool> formIsValid = ValueNotifier<bool>(false);

  AuthController() {
    email.addListener(() => formIsValid.value = _formIsValid());
    password.addListener(() => formIsValid.value = _formIsValid());
  }

  bool _formIsValid() => email.value.text.isNotEmpty && password.text.isNotEmpty;

  void showErrorAlert(UserErrorState error) {
    FlutterPlatformAlert.showAlert(
      windowTitle: "Ocorreu um erro ao realizar login",
      text: error.message,
      iconStyle: IconStyle.error,
      alertStyle: AlertButtonStyle.ok,
    );
  }
}