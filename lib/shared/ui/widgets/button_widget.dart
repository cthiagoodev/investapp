import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/shared/shared.dart';

final class ButtonWidget extends ElevatedButton {
  final String text;
  final bool enable;
  @override
  final void Function() onPressed;

  ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.enable = true,
  }) : super(
    onPressed: enable ? onPressed : null,
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStatePropertyAll(enable ? _theme.colorScheme.primary : Colors.grey),
      elevation: const MaterialStatePropertyAll(0),
      maximumSize: MaterialStatePropertyAll(Size(1.sw, 45.h)),
      minimumSize: MaterialStatePropertyAll(Size(200.w, 45.h)),
      fixedSize: MaterialStatePropertyAll(Size(1.sw, 45.h)),
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