import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investapp/modules/auth/domain/model/user.dart';
import 'package:investapp/modules/auth/domain/model/user_credentials.dart';
import 'package:investapp/modules/auth/domain/usecases/auth_user_usecase.dart';
import 'package:investapp/shared/basics/exceptions.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  final AuthUserUseCase _authUserUseCase;

  UserBloc(this._authUserUseCase) : super(UserState.initial());

  Future<void> login(UserCredentials credentials) async {
    emit(UserState.loading());
    try {
      User user = await _authUserUseCase.login(
        email: credentials.email,
        password: credentials.password,
      );
      emit(UserState.success(user));
    } on AppException catch(error, stackTrace) {
      emit(UserState.error(error.toString()));
    } catch(error, stackTrace) {
      emit(UserState.error("Ocorreu um erro ao realizar login"));
    }
  }

  void logout() {
    emit(UserState.logout());
  }
}
