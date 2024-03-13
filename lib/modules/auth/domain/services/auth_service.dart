import 'package:investapp/modules/auth/domain/model/user.dart';
import 'package:investapp/modules/auth/domain/repositories/remote/auth_remote_repository.dart';
import 'package:investapp/shared/shared.dart';

class AuthService {
  final IAuthRemoteRepository _remoteRepository;

  const AuthService(this._remoteRepository);

  Future<User> login({required String email, required String password}) async {
    final User? user = await _remoteRepository.login(
      email: email, password: password);

  if(user == null) {
    throw NoDataException("Não foi encontrado nenhum usuário com essas credenciais");
  }

    return user;
  }

  Future<User> register({required String email, required String password}) async {
    final User user = await _remoteRepository
        .register(email: email, password: password);
    return user;
  }
}