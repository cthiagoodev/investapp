import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:investapp/modules/auth/presentation/widgets/auth_form_widget.dart';
import 'package:investapp/shared/base/base.dart';

final class LoginScreen extends BaseScreen<AuthController> {
  const LoginScreen({super.key});

  @override
  PreferredSizeWidget? get appBar => null;

  @override
  Widget builder(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: Container(
            color: theme.colorScheme.primary,
          ),
        ),
        Expanded(
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.all(20.w),
            child: Column(
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

                const AuthFormWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}