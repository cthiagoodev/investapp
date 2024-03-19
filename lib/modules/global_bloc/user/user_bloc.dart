import 'package:bloc/bloc.dart';
import 'package:investapp/modules/auth/domain/model/user.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, User?> {
  UserBloc() : super(null) {
    on<UserLoginEvent>(_handleUserLoginEvent);
    on<UserLogoutEvent>(_handleUserLogoutEvent);
  }

  void _handleUserLoginEvent(UserLoginEvent event, Emitter<User?> emit) {
    emit(event.user);
  }

  void _handleUserLogoutEvent(UserLogoutEvent event, Emitter<User?> emit) {
    emit(null);
  }
}
