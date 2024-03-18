import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/home/home.dart';
import 'package:investapp/modules/quote/quote.dart';
import 'package:investapp/shared/shared.dart';

final getIt = GetIt.I;

void initInjection() {
  ///Services
  GetIt.I.registerSingleton<HttpClient>(DioService(Dio()));

  ///Controllers
  GetIt.I.registerLazySingleton<HomeController>(() => HomeController());
  GetIt.I.registerLazySingleton<QuoteController>(() => QuoteController());
  GetIt.I.registerLazySingleton<QuoteDetailController>(() => QuoteDetailController());
}
