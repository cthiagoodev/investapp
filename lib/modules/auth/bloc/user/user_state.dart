part of 'user_bloc.dart';

abstract base class UserState {
  final User? user;
  UserState(this.user);

  factory UserState.initial() => UserInitialState(null);
  factory UserState.loading() => UserLoadingState(null);
  factory UserState.success(User user) => UserLoggedState(user);
  factory UserState.logout() => UserLogoutState(null);
  factory UserState.error(String error) => UserErrorState(error);
}

final class UserInitialState extends UserState {
  UserInitialState(super.user);
}

final class UserLoadingState extends UserState {
  UserLoadingState(super.user);
}

final class UserLoggedState extends UserState {
  UserLoggedState(super.user);
}

final class UserLogoutState extends UserState {
  UserLogoutState(super.user);
}

final class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message) : super(null);
}
