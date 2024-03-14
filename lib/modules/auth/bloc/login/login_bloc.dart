import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:investapp/modules/auth/domain/model/user.dart';
import 'package:investapp/modules/auth/domain/services/auth_service.dart';
import 'package:investapp/shared/basics/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _service;

  LoginBloc(this._service) : super(LoginState.initial()) {
    on<LoginSubmittedEvent>(_handleLoginSubmittedEvent);
  }

  Future<void> _handleLoginSubmittedEvent(LoginSubmittedEvent event,
      Emitter<LoginState> emit) async {
    emit(LoginState.process());
    try {
      if(event.email.isEmpty || event.password.isEmpty) {
        throw CredentialException();
      }

      User user = await _service.login(
          email: event.email, password: event.password);
      emit(LoginState.success(user));
    } on AppException catch(error) {
      emit(LoginState.error(error));
    } on FirebaseAuthMultiFactorException catch(error) {
      emit(LoginState.error(error));
    } on FirebaseAuthException catch(error) {
      emit(LoginState.error(error));
    } catch(error) {
      emit(LoginState.error("Ocorreu um erro ao realizar login"));
    }
  }
}
