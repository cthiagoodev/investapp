part of 'user_bloc.dart';

abstract class UserEvent {}

class UserLoginEvent extends UserEvent {
  final User user;
  UserLoginEvent(this.user);
}

class UserLogoutEvent extends UserEvent {}
