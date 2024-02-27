import 'package:investapp/modules/user/domain/entities/user.dart';

abstract interface class IUserRemoteRepository {
  Future<User?> login({required String email, required String password});
  Future<User> register({required String email, required String password});
}