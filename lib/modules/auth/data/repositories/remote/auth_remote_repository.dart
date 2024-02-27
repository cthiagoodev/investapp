import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:investapp/modules/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:investapp/modules/auth/domain/repositories/remote/auth_remote_repository.dart';
import 'package:investapp/modules/user/domain/entities/user.dart';
import 'package:investapp/modules/user/user.dart';

final class AuthRemoteRepository implements IAuthRemoteRepository {
  final AuthRemoteDataSource _source;

  AuthRemoteRepository(this._source);

  @override
  Future<User?> login({required String email, required String password}) async {
    final auth.UserCredential? credential = await _source.login(email, password);

    if(credential?.user == null) {
      return null;
    }

    final User appUser = User(
      uuid: credential!.user!.uid,
      email: credential.user!.email ?? "",
      name: credential.user!.displayName ?? "",
      profileImage: credential.user!.photoURL ?? "",
      accessToken: credential.credential!.accessToken!,
      token: credential.credential!.token!,
    );

    return appUser;
  }

  @override
  Future<User> register({required String email, required String password}) async {
    final auth.UserCredential? credential = await _source.register(email, password);

    final User appUser = User(
      uuid: credential!.user!.uid,
      email: credential.user!.email ?? "",
      name: credential.user!.displayName ?? "",
      profileImage: credential.user!.photoURL ?? "",
      accessToken: credential.credential!.accessToken!,
      token: credential.credential!.token!,
    );

    return appUser;
  }
}