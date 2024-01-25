part of 'base.dart';

sealed class BaseApp<T extends Object> extends StatefulWidget {
  const BaseApp({super.key});

  T get controller => GetIt.I.get<T>();

  initState() {}

  dispose() {}

  Widget builder(BuildContext context);
}