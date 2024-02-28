import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/shared/shared.dart';

final class ButtonWidget extends ElevatedButton {
  final String text;

  ButtonWidget({
    super.key,
    required this.text,
    required super.onPressed,
  }) : super(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStatePropertyAll(_theme.colorScheme.primary),
      elevation: const MaterialStatePropertyAll(0),
      maximumSize: MaterialStatePropertyAll(Size(1.sw, 40.h)),
      minimumSize: MaterialStatePropertyAll(Size(200.w, 40.h)),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.r),
      ))
    ),
    child: Text(
      text,
      style: _theme.textTheme.labelSmall?.copyWith(
        color: Colors.white,
      ),
    ),
  );

  static ThemeData get _theme => Theme.of(GlobalContext().context!);
}