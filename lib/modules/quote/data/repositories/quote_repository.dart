import 'package:investapp/modules/quote/data/datasources/remote/quote_remote_datasource.dart';
import 'package:investapp/modules/quote/domain/entities/quote.dart';
import 'package:investapp/modules/quote/domain/repositories/quote_repository.dart';

class RemoteQuoteRepository implements IRemoteQuoteRepository {
  final QuoteRemoteDataSource _source;

  const RemoteQuoteRepository(this._source);

  @override
  Future<Quote> get() async {
    final Map<String, dynamic> response = await _source.fetch();
    return Quote.fromJson(response);
  }
}