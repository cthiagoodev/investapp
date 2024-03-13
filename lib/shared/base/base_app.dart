part of 'base.dart';

sealed class BaseApp<T extends Object> extends StatefulWidget {
  const BaseApp({super.key});

  T get viewModel => GetIt.I.get<T>();

  void initViewModel(BuildContext context) {}

  void initState() {}

  void dispose() {}

  Widget builder(BuildContext context);
}