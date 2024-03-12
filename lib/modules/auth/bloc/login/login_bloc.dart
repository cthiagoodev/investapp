import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:investapp/modules/auth/bloc/user/user_bloc.dart';
import 'package:investapp/modules/auth/domain/model/user.dart';
import 'package:investapp/modules/auth/domain/model/user_credentials.dart';
import 'package:investapp/modules/auth/domain/usecases/auth_user_usecase.dart';
import 'package:investapp/shared/basics/exceptions.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserCubit _userCubit;
  final AuthUserUseCase _authUserUseCase;

  LoginCubit(this._userCubit, this._authUserUseCase) : super(LoginInitialState(null));

  Future<void> onLoginSubmitted(UserCredentials credentials) async {
    emit(LoginInProcessState(null));
    try {
      final User user = await _authUserUseCase.login(
          email: credentials.email, password: credentials.password);
      _userCubit.setUser(user);
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
