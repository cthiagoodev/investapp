import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:investapp/modules/auth/domain/model/user.dart';
import 'package:investapp/modules/auth/domain/services/auth_service.dart';
import 'package:investapp/shared/shared.dart';

final class RegisterViewModel {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController confirmEmail = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final ValueNotifier<bool> isSending = ValueNotifier<bool>(false);
  final ValueNotifier<bool> formIsValid = ValueNotifier<bool>(false);

  final AuthService _authService;

  RegisterViewModel(this._authService) {
    name.addListener(_validateForm);
    email.addListener(_validateForm);
    confirmEmail.addListener(_validateForm);
    password.addListener(_validateForm);
    confirmPassword.addListener(_validateForm);
  }

  void _validateForm() {
    formIsValid.value =  name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        confirmEmail.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty;
  }

  Future<void> register(void Function() onRegister) async {
    try {
      isSending.value = true;
      final User user = await _authService.register(
          email: email.text, password: password.text);
      isSending.value = false;

      await FlutterPlatformAlert.showAlert(
        windowTitle: "Parabéns ${user.name}",
        text: "Sua conta foi criada com sucesso",
        alertStyle: AlertButtonStyle.ok,
        iconStyle: IconStyle.exclamation,
      );

      onRegister();
    } on Exception catch(error, stackTrace) {
      _handleError(error, stackTrace);
    }
  }

  void _handleError(Exception error, StackTrace stackTrace) {
    log(error.toString(), error: error, stackTrace: stackTrace);
    FlutterPlatformAlert.showAlert(
      windowTitle: "Ocorreu um erro",
      text: error.toString(),
      alertStyle: AlertButtonStyle.ok,
      iconStyle: IconStyle.error,
    );
  }
}