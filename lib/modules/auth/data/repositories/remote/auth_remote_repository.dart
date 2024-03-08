import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:investapp/modules/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:investapp/modules/auth/domain/model/user.dart';
import 'package:investapp/modules/auth/domain/repositories/remote/auth_remote_repository.dart';

final class AuthRemoteRepository implements IAuthRemoteRepository {
  final AuthRemoteDataSource _source;

  AuthRemoteRepository(this._source);

  @override
  Future<User?> login({required String email, required String password}) async {
    final auth.UserCredential? credential = await _source.login(email, password);

    if(credential?.user == null) {
      return null;
    }

    return User.fromFirebaseUser(credential!);
  }

  @override
  Future<User> register({required String email, required String password}) async {
    final auth.UserCredential credential = await _source.register(email, password);
    return User.fromFirebaseUser(credential);
  }
}