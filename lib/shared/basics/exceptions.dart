base class AppException implements Exception {
  final String? _message;

  AppException([this._message]);

  @override
  String toString() {
    Object? message = _message;
    if (_message == null) return "Exception";
    return "Exception: $message";
  }
}

final class NoDataException implements AppException {
  @override
  final String? _message;

  NoDataException([this._message]);

  @override
  String toString() {
    Object? message = _message;
    if (_message == null) return "Não foi possível encontrar os dados";
    return "$message";
  }
}

final class ServerException implements AppException {
  @override
  final String? _message;

  ServerException([this._message]);

  @override
  String toString() {
    Object? message = _message;
    if (_message == null) return "Ocorreu um erro no servidor";
    return "$message";
  }
}

final class NotFoundException implements AppException {
  @override
  final String? _message;

  NotFoundException([this._message]);

  @override
  String toString() {
    Object? message = _message;
    if (_message == null) return "Recurso não encontrado";
    return "$message";
  }
}

final class NotPermissionException implements AppException {
  @override
  final String? _message;

  NotPermissionException([this._message]);

  @override
  String toString() {
    Object? message = _message;
    if (_message == null) return "Você não tem permissão para acessar";
    return "$message";
  }
}

final class ConnectionTimeOutException implements AppException {
  @override
  final String? _message;

  ConnectionTimeOutException([this._message]);

  @override
  String toString() {
    Object? message = _message;
    if (_message == null) return "O tempo de resposta foi muito grande";
    return "$message";
  }
}
