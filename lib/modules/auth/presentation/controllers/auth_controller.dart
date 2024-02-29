import 'package:flutter/material.dart';

final class AuthController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final ValueNotifier<bool> formIsValid = ValueNotifier<bool>(false);

  AuthController() {
    email.addListener(() => formIsValid.value = _formIsValid());
    password.addListener(() => formIsValid.value = _formIsValid());
  }

  bool _formIsValid() => email.value.text.isNotEmpty && password.text.isNotEmpty;
}