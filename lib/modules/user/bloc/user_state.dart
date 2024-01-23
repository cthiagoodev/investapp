part of 'user_bloc.dart';

abstract base class UserState {
  final User? user;
  UserState(this.user);
}

final class UserInitialState extends UserState {
  UserInitialState(super.user);
}

final class UserAuthProcessState extends UserState {
  UserAuthProcessState(super.user);
}

final class UserLoginState extends UserState {
  UserLoginState(super.user);
}

final class UserLogoutState extends UserState {
  UserLogoutState(super.user);
}

final class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message) : super(null);
}
