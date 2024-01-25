import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investapp/shared/base/base.dart';
import 'package:investapp/shared/basics/context.dart';

final class CircleButtonWidget extends ElevatedButton {
  final String icon;
  final Color iconColor;
  final Color borderColor;

  CircleButtonWidget({
    super.key,
    required this.icon,
    this.iconColor = Colors.black,
    this.borderColor = Colors.grey,
    required super.onPressed,
    super.onLongPress,
  }) : super(
    style: ButtonStyle(
      elevation: const MaterialStatePropertyAll(0),
      padding: MaterialStatePropertyAll(EdgeInsets.all(10.w)),
      iconColor: MaterialStatePropertyAll(iconColor),
      alignment: Alignment.center,
      side: MaterialStatePropertyAll(BorderSide(
        color: borderColor,
      )),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.r),
      )),
    ),
    child: SvgPicture.asset(
      icon,
      color: iconColor,
      alignment: Alignment.center,
    ),
  );

  static ThemeData get _theme => Theme.of(GlobalContext().context!);
}