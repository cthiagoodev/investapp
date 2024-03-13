part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
  factory LoginState.initial() => LoginInitialState();
  factory LoginState.process() => LoginProcessState();
  factory LoginState.success(User user) => LoginSuccessState(user);
  factory LoginState.error(Object error) => LoginErrorState(error);
}

class LoginInitialState extends LoginState {}

class LoginProcessState extends LoginState {}

class LoginSuccessState extends LoginState {
  final User user;

  const LoginSuccessState(this.user);
}

class LoginErrorState extends LoginState {
  final Object error;

  const LoginErrorState(this.error);
}
