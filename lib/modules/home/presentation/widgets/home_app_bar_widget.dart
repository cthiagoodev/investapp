import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investapp/modules/home/presentation/controllers/home_controller.dart';
import 'package:investapp/modules/user/user.dart';
import 'package:investapp/shared/shared.dart';

final class HomePreferredSizeWidget extends PreferredSize {
  const HomePreferredSizeWidget({super.key, required super.child}) : super(preferredSize: const Size.fromHeight(100));
}

final class HomeAppBarWidget extends BaseWidget<HomeController> {
  const HomeAppBarWidget({super.key});

  @override
  Widget builder() {
    return Row(
      children: [
        UserImageProfileWidget(),

        Column(
          children: [
            Text(
              "Bem vindo(a) de volta",
              style: theme.textTheme.bodySmall,
            ),


            _buildUserName(),
          ],
        ),
      ],
    );
  }

  Widget _buildUserName() {
    final UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if(state is LoginUser) {
          return Text("Thiago Sousa", style: theme.textTheme.bodyMedium);
        }

        if(state is AuthUser) {
          return Text("Aguarde...", style: theme.textTheme.bodyMedium);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
