import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/app/app.dart';
import 'package:investapp/shared/shared.dart';

final getIt = GetIt.I;

void initInjection() {
  getIt.registerSingleton<HttpClient>(DioService(Dio()));
  getIt.registerSingleton<AppViewModel>(AppViewModel());
}
