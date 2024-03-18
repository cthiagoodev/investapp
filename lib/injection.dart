import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/app/app.dart';
import 'package:investapp/modules/home/home.dart';
import 'package:investapp/modules/quote/quote.dart';
import 'package:investapp/shared/shared.dart';

final getIt = GetIt.I;

void initInjection() {
  ///Services
  getIt.registerSingleton<HttpClient>(DioService(Dio()));

  ///Controllers
  getIt.registerSingleton<AppViewModel>(AppViewModel());
  getIt.registerLazySingleton<QuoteController>(() => QuoteController());
  getIt.registerLazySingleton<QuoteDetailController>(() => QuoteDetailController());
}
