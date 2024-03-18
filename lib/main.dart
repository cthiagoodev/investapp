import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/injection.dart';
import 'package:investapp/modules/app/app.dart';
import 'package:investapp/shared/services/firebase/firebase_service.dart';

void main() async {
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    initializeFirebase(),
  ]);
  initInjection();
  runApp(App(AppController()));
}
