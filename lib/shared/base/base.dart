import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/home/home.dart';
import 'package:investapp/shared/basics/context.dart';

export "package:flutter/material.dart";

sealed class BaseApp<T extends Object> extends StatelessWidget {
  const BaseApp({super.key});

  T get controller => GetIt.I.get<T>();

  BuildContext get context => GlobalContext().context!;

  Widget builder();
}

abstract base class BaseScreen<T extends Object> extends BaseApp<T> {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: const HomePreferredSizeWidget(child: HomeAppBarWidget()),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: builder(),
        ),
      ),
    );
  }
}

abstract base class BaseWidget<T extends Object> extends BaseApp<T> {
  const BaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return builder();
  }
}
