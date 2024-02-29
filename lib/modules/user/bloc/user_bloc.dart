import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investapp/modules/user/domain/entities/user.dart';
import 'package:investapp/modules/user/domain/usecases/auth_user_usecase.dart';
import 'package:investapp/shared/basics/exceptions.dart';

part 'user_event.dart';
part 'user_state.dart';

final class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthUserUseCase _getUserUseCase;

  UserBloc(this._getUserUseCase) : super(UserInitialState(null)) {
    on<UserLoginEvent>(_onLogin);
  }

  void login(String email, String password) => add(UserLoginEvent(email, password));

  Future<void> _onLogin(UserLoginEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserAuthProcessState(null));
      final User user = await _getUserUseCase.login(
          email: event.email, password: event.password);
      emit(UserLoginState(user));
    } on AppException catch(error, stackTrace) {
      log(error.toString(), error: error, stackTrace: stackTrace);
      emit(UserErrorState(error.toString()));
    } on FirebaseAuthException catch(error, stackTrace) {
      log(error.toString(), error: error, stackTrace: stackTrace);
      emit(UserErrorState(error.message ?? "[FirebaseAuth] - Ocorreu um erro ao realizar login"));
    } catch(error, stackTrace) {
      log(error.toString(), error: error, stackTrace: stackTrace);
      emit(UserErrorState("Ocorreu um erro ao realizar login"));
    }
  }
}
