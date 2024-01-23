import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investapp/shared/shared.dart';

final class DefaultPreferredSizeWidget extends PreferredSize {
  const DefaultPreferredSizeWidget({super.key, required super.child}) : super(preferredSize: const Size.fromHeight(150));
}

final class DefaultAppBarWidget extends BaseWidget {
  const DefaultAppBarWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20.w,
        left: 20.w,
        right: 20.w,
        bottom: 10.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(
              Icons.CHEVRON_LEFT_SOLID,
              color: Colors.black,
              height: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
