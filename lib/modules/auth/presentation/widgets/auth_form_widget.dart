import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investapp/modules/auth/auth.dart';
import 'package:investapp/modules/user/bloc/user_bloc.dart';
import 'package:investapp/modules/user/user.dart';
import 'package:investapp/shared/shared.dart';

final class AuthFormWidget extends BaseWidget<AuthController> {
  const AuthFormWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return switch(state.runtimeType) {
          UserAuthProcessState ||
          UserLogoutState ||
          UserInitialState => _buildState(state),
          _ => SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildState(UserState state) {
    bool isLoading = state is UserAuthProcessState;
    return Form(
      child: Column(
        children: [
          InputWidget(),
        ],
      ),
    );
  }
}