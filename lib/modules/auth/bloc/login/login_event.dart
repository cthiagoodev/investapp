part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginSubmittedEvent(this.email, this.password);
}
