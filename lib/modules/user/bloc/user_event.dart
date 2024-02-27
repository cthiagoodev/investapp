part of 'user_bloc.dart';

abstract base class UserEvent {}

final class UserLoginEvent extends UserEvent {
  final String email;
  final String password;
  UserLoginEvent(this.email, this.password);
}

final class UserLogoutEvent extends UserEvent {}

final class UserErrorEvent extends UserEvent {
  final String message;
  UserErrorEvent(this.message);
}
