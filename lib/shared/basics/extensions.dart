import 'package:get_it/get_it.dart';

extension RegisterExtension on GetIt {
  T registerIfNotRegistered<T extends Object>(T instance) {
    if(GetIt.I.isRegistered<T>()) {
      return GetIt.I.get<T>();
    }
    return GetIt.I.registerSingleton<T>(instance);
  }
}