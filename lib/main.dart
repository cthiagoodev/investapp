import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/app/app.dart';
import 'package:investapp/shared/services/firebase/firebase_service.dart';

void main() {
  ScreenUtil.ensureScreenSize();
  initializeFirebase();
  runApp(App(AppController()));
}
