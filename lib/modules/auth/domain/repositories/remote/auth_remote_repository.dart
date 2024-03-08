import 'package:investapp/modules/auth/domain/model/user.dart';

abstract interface class IAuthRemoteRepository {
  Future<User?> login({required String email, required String password});
  Future<User> register({required String email, required String password});
}