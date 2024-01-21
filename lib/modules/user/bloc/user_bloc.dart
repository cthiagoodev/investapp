import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investapp/modules/user/domain/entities/user.dart';

final class UserBloc extends Bloc<UserEvent, User?> {
  UserBloc() : super(null) {
    on<LoginUser>((event, emit) => emit(null));
  }
}

class UserEvent {
  User? user;
  UserEvent(this.user);
}

final class LoginUser extends UserEvent {
  LoginUser(super.user);
}

final class AuthUser extends UserEvent {
  AuthUser(super.user);
}

final class LogoutUser extends UserEvent {
  LogoutUser(super.user);
}

final class ErrorUser extends UserEvent {
  final Object error;
  ErrorUser(this.error) : super(null);
}
