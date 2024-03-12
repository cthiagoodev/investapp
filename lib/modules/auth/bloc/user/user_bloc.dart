import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investapp/modules/auth/domain/model/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  UserCubit() : super(UserInitialState(null));

  void setUser(User newUser) => emit(UserLoginState(newUser));

  void remoteUser() => emit(UserLogoutState(null));
}
