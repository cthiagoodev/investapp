import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investapp/modules/auth/domain/model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

final class UserBloc extends Bloc<UserEvent, UserState> {

  UserBloc() : super(UserInitialState(null));
}
