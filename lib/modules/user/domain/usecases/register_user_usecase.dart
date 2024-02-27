import 'package:investapp/modules/user/domain/repositories/remote/user_remote_repository.dart';
import 'package:investapp/modules/user/user.dart';

final class RegisterUserUseCase {
  final IUserRemoteRepository _remoteRepository;

  const RegisterUserUseCase(this._remoteRepository);

  Future<User> register({required String email, required String password}) async {
    final User user = await _remoteRepository
        .register(email: email, password: password);
    return user;
  }
}