part of "login_bloc.dart";

abstract class LoginEvent {}

final class LoginSubmittedEvent extends LoginEvent {
  final UserCredentials credentials;
  LoginSubmittedEvent(this.credentials);
}

final class LoginErrorEvent extends LoginEvent {
  final Object error;
  LoginErrorEvent(this.error);
}
