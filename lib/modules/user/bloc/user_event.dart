part of 'user_bloc.dart';

abstract base class UserEvent {}

final class UserLoginEvent extends UserEvent {}

final class UserLogoutEvent extends UserEvent {}

final class UserErrorEvent extends UserEvent {
  final String message;
  UserErrorEvent(this.message);
}
