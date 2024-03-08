import 'package:bloc/bloc.dart';
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
      User response = await _authUserUseCase.login(
        email: event.credentials.email,
        password: event.credentials.password,
      );

      emit(LoginSuccessState(response));
    } on AppException catch(error, stackTrance) {

    } catch {

    }
  }
 }