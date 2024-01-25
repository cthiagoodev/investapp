import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/shared/ui/widgets/default_appbar_widget.dart';

export "package:flutter/material.dart";

sealed class BaseApp<T extends Object> extends StatelessWidget {
  const BaseApp({super.key});

  T get controller => GetIt.I.get<T>();

  Widget builder(BuildContext context);
}

abstract base class BaseScreen<T extends Object> extends BaseApp<T> {
  const BaseScreen({super.key});

  PreferredSizeWidget get appBar => const DefaultPreferredSizeWidget(child: DefaultAppBarWidget());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: appBar,
        body: builder(context),
      ),
    );
  }
}

abstract base class BaseWidget<T extends Object> extends BaseApp<T> {
  const BaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
