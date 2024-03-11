import 'package:firebase_auth/firebase_auth.dart';
import 'package:investapp/modules/auth/bloc/login/login_bloc.dart';
import 'package:investapp/modules/auth/bloc/user/user_bloc.dart';
import 'package:investapp/modules/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:investapp/modules/auth/data/repositories/remote/auth_remote_repository.dart';
import 'package:investapp/modules/auth/domain/usecases/auth_user_usecase.dart';
import 'package:investapp/modules/auth/presentation/view_model/auth_view_model.dart';

final AuthViewModel authBinding = AuthViewModel(
    LoginBloc(AuthUserUseCase(AuthRemoteRepository(AuthRemoteDataSource(FirebaseAuth.instance)))),
    UserBloc(),
);