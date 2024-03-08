import 'package:bloc/bloc.dart';
import 'package:investapp/modules/auth/domain/model/user.dart';

part 'login_event.dart';
part 'login_state.dart';

final class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState(null));
}