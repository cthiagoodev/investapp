import 'package:investapp/modules/quote/data/datasources/remote/quote_remote_datasource.dart';
import 'package:investapp/modules/quote/domain/entities/quote.dart';
import 'package:investapp/modules/quote/domain/repositories/quote_repository.dart';

class RemoteQuoteRepository implements IRemoteQuoteRepository {
  final QuoteRemoteDataSource _source;

  const RemoteQuoteRepository(this._source);

  @override
  Future<List<Quote>> list() async {
    final List<Map<String, dynamic>> response = await _source.fetch();
    return List<Quote>.from(response.map((e) => Quote.fromJson(e)));
  }
}