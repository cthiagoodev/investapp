import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/app/presentation/controllers/app_controller.dart';
import 'package:investapp/modules/user/user.dart';
import 'package:investapp/shared/shared.dart';

final class App extends StatelessWidget {
  final AppController _controller;

  const App(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, minTextAdapt: true);
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) {
          return UserBloc(AuthUserUseCase(UserRemoteRepository(UserRemoteDataSource(FirebaseAuth.instance))));
        }),
      ],
      child: MaterialApp(
        title: "InvestApp",
        initialRoute: AppRoutes.home,
        debugShowCheckedModeBanner: false,
        theme: theme,
        onGenerateRoute: _controller.onGenerateRoute,
        builder: (context, child) {
          GlobalContext().context ??= context;
          return child!;
        },
      ),
    );
  }
}