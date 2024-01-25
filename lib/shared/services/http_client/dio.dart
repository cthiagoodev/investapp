import 'package:dio/dio.dart' hide Response;
import 'package:investapp/shared/basics/exceptions.dart';
import 'package:investapp/shared/basics/interfaces.dart';
import 'package:investapp/shared/basics/models.dart';

final class DioService implements HttpClient {
  final Dio _dio;

  DioService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: "https://brapi.dev",
    );

    _dio.interceptors.add(LogInterceptor());
  }

  @override
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(path);

      if(response.data == null) {
        throw NoDataException();
      }

      return _handleSuccess<T>(response);
    } on DioException catch(error) {
      throw _handleError(error);
    } catch(error) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> post<T>(
      String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(path);

      if(response.data == null) {
        throw NoDataException();
      }

      return _handleSuccess<T>(response);
    } on DioException catch(error) {
      throw _handleError(error);
    } catch(error) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> put<T>(
      String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(path);

      if(response.data == null) {
        throw NoDataException();
      }

      return _handleSuccess<T>(response);
    } on DioException catch(error) {
      throw _handleError(error);
    } catch(error) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> delete<T>(
      String path, {Map<String, dynamic>? data, Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(path);

      if(response.data == null) {
        throw NoDataException();
      }

      return _handleSuccess<T>(response);
    } on DioException catch(error) {
      throw _handleError(error);
    } catch(error) {
      rethrow;
    }
  }

  Response<T> _handleSuccess<T>(dynamic response) {
    return Response<T>(
      data: response.data!,
      headers: {},
      statusCode: response.statusCode!,
      statusMessage: response.statusMessage ?? "",
    );
  }

  AppException _handleError(DioException error) {
    if(error.type == DioExceptionType.connectionTimeout) {
      return ConnectionTimeOutException();
    }

    return switch(error.response?.statusCode) {
      500 => ServerException(),
      404 => NotFoundException(),
      403 => NotPermissionException(),
      _ => AppException(error.message),
    };
  }
}