import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/shared/shared.dart';

final class InputWidget extends TextFormField {
  final String hintText;

  InputWidget({
    super.key,
    this.hintText = "",
    super.autocorrect,
    super.controller,
    super.enabled,
    super.initialValue,
    super.inputFormatters,
    super.textInputAction,
    super.keyboardType,
    super.autofocus,
    super.maxLength,
    super.maxLines,
    super.focusNode,
    super.textAlign,
    super.validator,
    super.obscureText,
  }) : super(
    style: _theme.textTheme.labelSmall,
    decoration: InputDecoration(
      fillColor: Colors.grey.withOpacity(.1),
      filled: true,
      hintText: hintText,
      hintStyle: _theme.textTheme.labelSmall?.copyWith(
        color: Colors.grey,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
    ),
  );

  static ThemeData get _theme => Theme.of(GlobalContext().context!);
}