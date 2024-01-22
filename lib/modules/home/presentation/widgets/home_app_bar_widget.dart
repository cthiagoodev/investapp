import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/home/presentation/controllers/home_controller.dart';
import 'package:investapp/modules/user/user.dart';
import 'package:investapp/shared/shared.dart';

final class HomePreferredSizeWidget extends PreferredSize {
  const HomePreferredSizeWidget({super.key, required super.child}) : super(preferredSize: const Size.fromHeight(150));
}

final class HomeAppBarWidget extends BaseWidget<HomeController> {
  const HomeAppBarWidget({super.key});

  @override
  Widget builder() {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10.w,
        left: 20.w,
        right: 20.w,
        bottom: 10.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UserImageProfileWidget(),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bem vindo(a) de volta",
                style: theme.textTheme.bodySmall,
              ),


              _buildUserName(),
            ],
          ),
          
          SizedBox(
            width: 40.w,
            height: 40.w,
            child: CircleButtonWidget(
              icon: Icons.BELL_REGULAR,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserName() {
    final UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if(state is LoginUser) {
          return Text("Thiago Sousa", style: _nameStyle());
        }

        if(state is AuthUser) {
          return Text("Aguarde...", style: _nameStyle());
        }

        return Text("Thiago Sousa", style: _nameStyle());
      },
    );
  }

  TextStyle? _nameStyle() {
    return theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700);
  }
}
