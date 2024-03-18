import 'package:investapp/injection.dart';
import 'package:investapp/modules/home/presentation/viewmodels/home_viewmodel.dart';
import 'package:investapp/shared/basics/extensions.dart';
import 'package:investapp/shared/shared.dart';

class HomeBinding implements Binding {
  @override
  void dependencies() {
    getIt.registerIfNotRegistered<HomeViewModel>(HomeViewModel());
  }

  @override
  void dispose() {
    getIt.unregister<HomeViewModel>();
  }
}