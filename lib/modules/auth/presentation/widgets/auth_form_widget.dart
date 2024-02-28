import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe seu e-mail",
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe sua senha",
              controller: controller.password,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.send,
            ),
          ),

          ButtonWidget(
            text: "Entrar",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}