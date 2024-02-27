import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:investapp/modules/user/data/datasources/remote/user_remote_datasource.dart';
import 'package:investapp/modules/user/domain/entities/user.dart';
import 'package:investapp/modules/user/domain/repositories/remote/user_remote_repository.dart';

final class UserRemoteRepository implements IUserRemoteRepository {
  final UserRemoteDataSource _source;

  UserRemoteRepository(this._source);

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