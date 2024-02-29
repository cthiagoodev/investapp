import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/auth/presentation/controllers/register_controller.dart';
import 'package:investapp/shared/base/base.dart';
import 'package:investapp/shared/shared.dart';

final class RegisterScreen extends BaseScreen<RegisterController> {
  const RegisterScreen({super.key});

  @override
  PreferredSizeWidget? get appBar => null;

  @override
  dispose() {
    GetIt.I.unregister<RegisterController>();
    return super.dispose();
  }

  @override
  Widget builder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.APP_ICON,
                  height: 40.sp,
                ),
                Text(
                  "Crie a \nsua conta",
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: InputWidget(
                        hintText: "Informe seu nome",
                        textInputAction: TextInputAction.next,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: InputWidget(
                        hintText: "Informe seu e-mail",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: InputWidget(
                        hintText: "Confirme seu e-mail",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: InputWidget(
                        hintText: "Informe sua senha",
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: InputWidget(
                        hintText: "Confirme sua senha",
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}