import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/app/app.dart';

void main() {
  ScreenUtil.ensureScreenSize();
  runApp(App(AppController()));
}