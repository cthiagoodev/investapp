import 'package:go_router/go_router.dart';
import 'package:investapp/modules/auth/auth.dart';
import 'package:investapp/shared/basics/routes.dart';

GoRouter routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: "Login",
      builder: (context, state) => _builder(state, LoginView(), binding),
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