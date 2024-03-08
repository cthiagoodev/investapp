part of "login_bloc.dart";

abstract class LoginEvent {}

final class LoginInEvent extends LoginEvent {}

final class LoginErrorEvent extends LoginEvent {
  final Object error;
  LoginErrorEvent(this.error);
}
