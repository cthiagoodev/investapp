import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/auth/bloc/login/login_bloc.dart';
import 'package:investapp/modules/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:investapp/modules/auth/data/repositories/remote/auth_remote_repository.dart';
import 'package:investapp/modules/auth/domain/services/auth_service.dart';
import 'package:investapp/modules/auth/presentation/view_model/login_view_model.dart';
import 'package:investapp/modules/global_bloc/user/user_bloc.dart';
import 'package:investapp/shared/basics/extensions.dart';
import 'package:investapp/shared/basics/interfaces.dart';
import 'package:investapp/shared/shared.dart';

class LoginBinding implements Binding {
  @override
  void dependencies() {
    GetIt.I.registerIfNotRegistered<LoginViewModel>(
        LoginViewModel(
          LoginBloc(
            AuthService(AuthRemoteRepository(AuthRemoteDataSource(FirebaseAuth.instance))),
            BlocProvider.of<UserBloc>(GlobalContext().context!),
          ),
        ));
  }

  @override
  void dispose() {
    GetIt.I.unregister<LoginViewModel>();
  }
}