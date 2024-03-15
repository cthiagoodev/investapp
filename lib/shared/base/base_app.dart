part of 'base.dart';

sealed class BaseApp<T extends Object> extends StatefulWidget {
  const BaseApp({super.key});

  T get viewModel => GetIt.I.get<T>();

  void initState(BuildContext context) {}

  void dispose() {}

  Widget builder(BuildContext context);
}