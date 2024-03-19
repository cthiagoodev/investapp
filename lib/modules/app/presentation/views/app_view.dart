import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/global_bloc//user/user_bloc.dart';
import 'package:investapp/router.dart';
import 'package:investapp/shared/shared.dart';

final class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, minTextAdapt: true);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: "InvestApp",
        routerConfig: routerConfig,
        debugShowCheckedModeBanner: false,
        theme: theme,
        builder: (context, child) {
          GlobalContext().context ??= context;
          return child!;
        },
      ),
    );
  }
}