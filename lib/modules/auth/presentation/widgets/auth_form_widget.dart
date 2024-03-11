import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/auth/bloc/login/login_bloc.dart';
import 'package:investapp/modules/auth/presentation/view_model/auth_view_model.dart';
import 'package:investapp/shared/shared.dart';

final class AuthFormWidget extends BaseWidget<AuthViewModel> {
  const AuthFormWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => viewModel.loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: _listener,
        builder: _buildState,
      ),
    );
  }

  void _listener(BuildContext context, LoginState state) {
    if(state is LoginSuccessState) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }

    if(state is LoginErrorState) {
      viewModel.showErrorAlert(state);
      viewModel.password.clear();
    }
  }

  Widget _buildState(BuildContext context, LoginState state) {
    bool isLoading = state is LoginInProcessState;
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe seu e-mail",
              controller: viewModel.email,
              enabled: !isLoading,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe sua senha",
              controller: viewModel.password,
              enabled: !isLoading,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.send,
            ),
          ),

          ValueListenableBuilder<bool>(
            valueListenable: viewModel.formIsValid,
            builder: (context, formIsValid, child) {
              return ButtonLoadingWidget(
                text: "Entrar",
                enable: formIsValid && !isLoading,
                onPressed: viewModel.login,
              );
            },
          )
        ],
      ),
    );
  }
}