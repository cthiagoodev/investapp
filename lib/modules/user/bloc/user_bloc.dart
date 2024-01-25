import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investapp/modules/user/domain/entities/user.dart';

part 'user_state.dart';
part 'user_event.dart';

final class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState(null));
}
