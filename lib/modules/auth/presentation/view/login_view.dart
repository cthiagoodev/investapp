import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/auth/bloc/login/login_bloc.dart';
import 'package:investapp/modules/auth/presentation/view_model/login_view_model.dart';
import 'package:investapp/modules/auth/presentation/widgets/auth_form_widget.dart';
import 'package:investapp/shared/shared.dart';

final class LoginView extends BaseView<LoginViewModel> {
  const LoginView({super.key});

  @override
  PreferredSizeWidget? get appBar => null;

  @override
  Widget builder(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BlocProvider<LoginBloc>(
      create: (_) => viewModel.loginBloc,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()
        ),
        child: Column(
          children: [
            Container(
              height: .5.sh,
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: const AssetImage(AppImages.BACKGROUND_IMAGE_LOGIN),
                    alignment: Alignment.center,
                    colorFilter: ColorFilter.mode(theme.colorScheme.primary.withOpacity(.3), BlendMode.color),
                  )
              ),
            ),
            Container(
              width: 1.sw,
              height: .5.sh,
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "InvestApp",
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "Sua plataforma de investimentos.",
                        style: theme.textTheme.labelSmall,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AuthFormWidget(),

                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          "OU",
                          style: theme.textTheme.labelSmall,
                        ),
                      ),

                      TextButton(
                        onPressed: () => Navigator.of(context).pushNamed(AppRoutes.register),
                        child: Text(
                          "Crie sua conta",
                          style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.primary
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}