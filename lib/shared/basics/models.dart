final class Response<T> {
  final T data;
  final int statusCode;
  final String statusMessage;
  final Map<String, String> headers;

  Response({
    required this.data,
    required this.statusCode,
    required this.statusMessage,
    required this.headers,
  });
}