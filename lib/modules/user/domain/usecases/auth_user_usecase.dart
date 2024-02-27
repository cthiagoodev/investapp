import 'package:investapp/modules/user/domain/entities/user.dart';
import 'package:investapp/modules/user/domain/repositories/remote/user_remote_repository.dart';
import 'package:investapp/shared/basics/exceptions.dart';

final class AuthUserUseCase {
  final IUserRemoteRepository _remoteRepository;

  const AuthUserUseCase(this._remoteRepository);

  Future<User> login({required String email, required String password}) async {
    final User? user = await _remoteRepository.login(
        email: email, password: password);

    if(user == null) {
      throw NoDataException("Não foi encontrado nenhum usuário com essas credenciais");
    }

    return user;
  }
}