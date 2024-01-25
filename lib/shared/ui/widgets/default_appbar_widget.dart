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
        top: MediaQuery.of(context).padding.top + 50.h,
        left: 20.w,
        right: 20.w,
        bottom: 10.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

          Text(
            _getPageTitle(context),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox.shrink(),
        ],
      ),
    );
  }

  String _getPageTitle(BuildContext context) {
    return switch(ModalRoute.of(context)?.settings.name) {
      AppRoutes.quote => "Cotações disponíveis",
      _ => "Page",
    };
  }
}
