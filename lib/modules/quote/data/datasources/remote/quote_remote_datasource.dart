import 'package:investapp/shared/shared.dart';

class QuoteRemoteDataSource {
  final HttpClient _client;

  const QuoteRemoteDataSource(this._client);

  Future<List<Map<String, dynamic>>> fetch() async {
    const  String path = "/api/quote/list";
    final Response response = await _client.get(path);
    return response.data;
  }
}