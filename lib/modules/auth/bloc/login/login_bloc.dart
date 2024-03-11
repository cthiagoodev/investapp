import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:investapp/modules/auth/domain/model/user.dart';
import 'package:investapp/modules/auth/domain/model/user_credentials.dart';
import 'package:investapp/modules/auth/domain/usecases/auth_user_usecase.dart';
import 'package:investapp/shared/basics/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

final class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUserUseCase _authUserUseCase;

  LoginBloc(this._authUserUseCase) : super(LoginInitialState(null)) {
    on<LoginSubmittedEvent>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmittedEvent event, Emitter<LoginState> emit) async {
    emit(LoginInProcessState(null));
    try {
      final User user = await _authUserUseCase.login(
          email: event.credentials.email, password: event.credentials.password);
      emit(LoginSuccessState(user));
    } on AppException catch(error, stackTrace) {
      log(error.toString(), error: error, stackTrace: stackTrace);
      emit(LoginErrorState(error.toString()));
    } on FirebaseAuthException catch(error, stackTrace) {
      log(error.toString(), error: error, stackTrace: stackTrace);
      emit(LoginErrorState(error.message ?? "[FirebaseAuth] - Ocorreu um erro ao realizar login"));
    } catch(error, stackTrace) {
      log(error.toString(), error: error, stackTrace: stackTrace);
      emit(LoginErrorState("Ocorreu um erro ao realizar login"));
    }
  }
 }