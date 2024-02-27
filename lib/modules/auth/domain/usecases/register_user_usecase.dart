import 'package:investapp/modules/auth/domain/repositories/remote/auth_remote_repository.dart';
import 'package:investapp/modules/user/user.dart';

final class RegisterUserUseCase {
  final IAuthRemoteRepository _remoteRepository;

  const RegisterUserUseCase(this._remoteRepository);

  Future<User> register({required String email, required String password}) async {
    final User user = await _remoteRepository
        .register(email: email, password: password);
    return user;
  }
}