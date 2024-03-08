import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/auth/bloc/user/user_bloc.dart';
import 'package:investapp/modules/auth/presentation/view_model/auth_view_model.dart';
import 'package:investapp/shared/shared.dart';

final class AuthFormWidget extends BaseWidget<AuthViewModel> {
  const AuthFormWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: _listener,
      builder: _buildState,
    );
  }

  void _listener(BuildContext context, UserState state) {
    if(state is UserLoginState) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }

    if(state is UserErrorState) {
      controller.showErrorAlert(state);
      controller.password.clear();
    }
  }

  Widget _buildState(BuildContext context, UserState state) {
    bool isLoading = state is UserAuthProcessState;
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe seu e-mail",
              controller: controller.email,
              enabled: !isLoading,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe sua senha",
              controller: controller.password,
              enabled: !isLoading,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.send,
            ),
          ),

          ValueListenableBuilder<bool>(
            valueListenable: controller.formIsValid,
            builder: (context, formIsValid, child) {
              return ButtonLoadingWidget(
                text: "Entrar",
                enable: formIsValid && !isLoading,
                onPressed: () {
                  BlocProvider.of<UserBloc>(context)
                      .login(controller.email.text, controller.password.text);
                },
              );
            },
          )
        ],
      ),
    );
  }
}