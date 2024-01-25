import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/home/home.dart';
import 'package:investapp/modules/quote/quote.dart';
import 'package:investapp/shared/shared.dart';

final class AppController {
  AppController() {
    initInstances();
  }

  Route onGenerateRoute(RouteSettings settings) {
    return switch(settings.name) {
      AppRoutes.home => _buildRoute(settings, child: const HomeScreen()),
      AppRoutes.quote => _buildRoute(settings, child: const QuoteScreen()),
      AppRoutes.quoteDetail => _buildRoute(settings, child: const QuoteDetailScreen()),
      _ => _buildRoute(settings, child: const HomeScreen()),
    };
  }

  Route _buildRoute(RouteSettings settings, {required Widget child}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => child,
    );
  }

  void initInstances() {
    ///Services
    GetIt.I.registerSingleton<HttpClient>(DioService(Dio()));

    ///Controllers
    GetIt.I.registerLazySingleton<HomeController>(() => HomeController());
    GetIt.I.registerLazySingleton<QuoteController>(() => QuoteController());
    GetIt.I.registerLazySingleton<QuoteDetailController>(() => QuoteDetailController());
  }
}