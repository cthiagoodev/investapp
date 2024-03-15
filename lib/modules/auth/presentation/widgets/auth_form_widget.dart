import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/auth/bloc/login/login_bloc.dart';
import 'package:investapp/modules/auth/presentation/view_model/login_view_model.dart';
import 'package:investapp/shared/shared.dart';

final class AuthFormWidget extends BaseWidget<LoginViewModel> {
  const AuthFormWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: _buildState,
    );
  }

  Widget _buildState(BuildContext context, LoginState state) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe seu e-mail",
              controller: viewModel.email,
              enabled: !viewModel.loginIsInProcess(),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: InputWidget(
              hintText: "Informe sua senha",
              controller: viewModel.password,
              enabled: !viewModel.loginIsInProcess(),
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
                enable: formIsValid && !viewModel.loginIsInProcess(),
                onPressed: viewModel.login,
              );
            },
          )
        ],
      ),
    );
  }
}