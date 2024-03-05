import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/auth/presentation/controllers/register_controller.dart';
import 'package:investapp/modules/auth/presentation/widgets/register_form_widget.dart';
import 'package:investapp/modules/user/user.dart';
import 'package:investapp/shared/basics/extensions.dart';
import 'package:investapp/shared/shared.dart';

final class RegisterScreen extends BaseScreen<RegisterController> {
  const RegisterScreen({super.key});

  @override
  PreferredSizeWidget? get appBar => null;

  @override
  initState() {
    super.initState();
    GetIt.I.registerIfNotRegistered<RegisterController>(RegisterController(
        RegisterUserUseCase(UserRemoteRepository(UserRemoteDataSource(FirebaseAuth.instance)))));
  }

  @override
  dispose() {
    super.dispose();
    GetIt.I.unregister<RegisterController>();
  }

  @override
  Widget builder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20.w,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: InkWell(
                  onTap: Navigator.of(context).pop,
                  borderRadius: BorderRadius.circular(100.r),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Icons.CHEVRON_LEFT_SOLID,
                      alignment: Alignment.center,
                      height: 20.sp,
                    ),
                  ),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Image.asset(
                      AppImages.APP_ICON,
                      height: 40.sp,
                    ),
                  ),
                  Text(
                    "Crie a \nsua conta",
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),

          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const RegisterFormWidget(),
          ),
        ],
      ),
    );
  }
}