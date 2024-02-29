import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/auth/auth.dart';
import 'package:investapp/modules/home/home.dart';
import 'package:investapp/modules/quote/quote.dart';
import 'package:investapp/shared/shared.dart';

final class AppController {
  AppController() {
    _initInstances();
  }

  Route onGenerateRoute(RouteSettings settings) {
    return switch(settings.name) {
      AppRoutes.home => _buildRoute(settings, child: const HomeScreen()),
      AppRoutes.quote => _buildRoute(settings, child: const QuoteScreen()),
      AppRoutes.quoteDetail => _buildRoute(settings, child: const QuoteDetailScreen()),
      AppRoutes.login => _buildRoute(settings, child: const LoginScreen()),
      _ => _buildRoute(settings, child: const LoginScreen()),
    };
  }

  Route _buildRoute(RouteSettings settings, {required Widget child}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => child,
    );
  }

  void _initInstances() {
    ///Services
    GetIt.I.registerSingleton<HttpClient>(DioService(Dio()));

    ///Controllers
    GetIt.I.registerLazySingleton<HomeController>(() => HomeController());
    GetIt.I.registerLazySingleton<QuoteController>(() => QuoteController());
    GetIt.I.registerLazySingleton<QuoteDetailController>(() => QuoteDetailController());
    GetIt.I.registerLazySingleton<AuthController>(() => AuthController());
  }
}