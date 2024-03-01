import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:investapp/modules/user/user.dart';
import 'package:investapp/shared/shared.dart';

final class RegisterController {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController confirmEmail = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final ValueNotifier<bool> isSending = ValueNotifier<bool>(false);
  final ValueNotifier<bool> formIsValid = ValueNotifier<bool>(false);

  final RegisterUserUseCase _registerUserUseCase;

  RegisterController(this._registerUserUseCase) {
    name.addListener(_validateForm);
    email.addListener(_validateForm);
    confirmEmail.addListener(_validateForm);
    password.addListener(_validateForm);
    confirmPassword.addListener(_validateForm);
  }

  Future<void> register() async {
    try {
      isSending.value = true;
      final User user = await _registerUserUseCase.register(
          email: email.text, password: password.text);
      isSending.value = false;
      final AlertButton result = await FlutterPlatformAlert.showAlert(
        windowTitle: "Parabéns",
        text: "Sua conta foi criada com sucesso",
        alertStyle: AlertButtonStyle.ok,
        iconStyle: IconStyle.exclamation,
      );
    } on Exception catch(error, stackTrace) {
      _handleError(error, stackTrace);
    }
  }

  void _handleError(Exception error, StackTrace stackTrace) {
    log(error.toString(), error: error, stackTrace: stackTrace);
    FlutterPlatformAlert.showAlert(
      windowTitle: "Ocorreu um erro",
      text: error.toString(),
      alertStyle: AlertButtonStyle.retryCancel,
      iconStyle: IconStyle.error,
    );
  }

  void _validateForm() {
    formIsValid.value =  name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        confirmEmail.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty;
  }
}