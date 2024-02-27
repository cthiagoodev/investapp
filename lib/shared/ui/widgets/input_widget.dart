import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/shared/shared.dart';

final class InputWidget extends TextFormField {
  InputWidget({super.key}) : super(
    decoration: InputDecoration(
      fillColor: Colors.red,
      focusColor: Colors.red,
      hoverColor: Colors.red,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
    ),
  );

  static ThemeData get _theme => Theme.of(GlobalContext().context!);
}