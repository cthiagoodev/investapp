import 'package:investapp/shared/basics/models.dart';

abstract interface class HttpClient {
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});
  Future<Response<T>> post<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});
  Future<Response<T>> put<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});
  Future<Response<T>> delete<T>(String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});
}

abstract interface class Binding {
  void dependencies();
  void dispose();
}
