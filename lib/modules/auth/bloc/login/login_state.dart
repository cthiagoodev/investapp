part of 'login_bloc.dart';

abstract class LoginState {
  final User? user;
  LoginState(this.user);
}

final class LoginInitialState extends LoginState {
  LoginInitialState(super.user);
}

final class LoginInProcessState extends LoginState {
  LoginInProcessState(super.user);
}

final class LoginSuccessState extends LoginState {
  LoginSuccessState(super.user);
}

final class LoginErrorState extends LoginState {
  final Object error;
  LoginErrorState(this.error) : super(null);
}
