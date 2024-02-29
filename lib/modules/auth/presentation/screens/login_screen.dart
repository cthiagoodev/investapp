import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:investapp/modules/auth/presentation/widgets/auth_form_widget.dart';
import 'package:investapp/shared/base/base.dart';
import 'package:investapp/shared/shared.dart';

final class LoginScreen extends BaseScreen<AuthController> {
  const LoginScreen({super.key});

  @override
  PreferredSizeWidget? get appBar => null;

  @override
  dispose() {
    super.dispose();
    GetIt.I.unregister<AuthController>();
  }

  @override
  Widget builder(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
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
                image: AssetImage(AppImages.BACKGROUND_IMAGE_LOGIN),
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

                const AuthFormWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}