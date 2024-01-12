import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investapp/shared/base/base.dart';

final ThemeData theme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF00ACEE),
    secondary: Colors.black,
    background: Colors.white,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
    ),
    labelLarge: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
    ),
  ),
);
