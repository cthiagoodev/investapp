import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/user/bloc/user_bloc.dart';
import 'package:investapp/shared/shared.dart';

final class UserImageProfileWidget extends BaseWidget {
  const UserImageProfileWidget({super.key});

  @override
  Widget builder() {
    return BlocBuilder(
      bloc: BlocProvider.of<UserBloc>(context),
      builder: (context, state) {
        return switch(state.runtimeType) {
          LoginUser => _buildImageProfile(),
          AuthUser => _buildLoading(),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildImageProfile() {
    return CircleAvatar(
      radius: 50.r,
    );
  }

  Widget _buildLoading() {
    return SizedBox(
      width: 50.w,
      height: 50.w,
      child: const CircularProgressIndicator(),
    );
  }
}