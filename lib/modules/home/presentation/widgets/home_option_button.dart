import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investapp/modules/home/presentation/controllers/home_controller.dart';
import 'package:investapp/shared/shared.dart';

final class HomeOptionButton extends BaseWidget<HomeController> {
  final String icon;
  final String title;
  final String description;
  final void Function() onPressed;

  const HomeOptionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget builder(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: SvgPicture.asset(
                        icon,
                        color: theme.colorScheme.primary,
                        height: 28.sp,
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.labelMedium,
                          ),

                          Text(
                            description,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const Divider(
                    thickness: .5,
                    color: Colors.black12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}