import 'package:go_router/go_router.dart';
import 'package:investapp/modules/auth/auth.dart';
import 'package:investapp/shared/shared.dart';

GoRouter routerConfig = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: "Login",
      builder: (context, state) =>
          _builder(state, const LoginView(), LoginBinding()),
      onExit: (context) => _onExit(LoginBinding()),
    ),
  ],
);

Widget _builder(GoRouterState state, Widget page, Binding binding) {
  binding.dependencies();
  return page;
}

Future<bool> _onExit(Binding binding) async {
  binding.dispose();
  return true;
}