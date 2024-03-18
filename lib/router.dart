import 'package:go_router/go_router.dart';
import 'package:investapp/modules/auth/auth.dart';
import 'package:investapp/modules/home/home.dart';
import 'package:investapp/shared/shared.dart';

GoRouter routerConfig = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: "Home",
      builder: (context, state) =>
          _builder(state, const HomeView(), HomeBinding()),
      onExit: (context) => _onExit(HomeBinding()),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: "Login",
      builder: (context, state) =>
          _builder(state, const LoginView(), LoginBinding()),
      onExit: (context) => _onExit(LoginBinding()),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: "Register",
      builder: (context, state) =>
          _builder(state, const RegisterView(), RegisterBinding()),
      onExit: (context) => _onExit(RegisterBinding()),
    ),
  ],
);

Widget _builder(GoRouterState state, Widget page, [Binding? binding]) {
  binding?.dependencies();
  return page;
}

Future<bool> _onExit([Binding? binding]) async {
  binding?.dispose();
  return true;
}