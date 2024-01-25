import 'package:investapp/modules/quote/domain/entities/quote.dart';

enum SortByOptions {name, close, change, change_abs, volume, market_cap_basic, sector}
enum SortOrderOptions {desc, asc}

abstract interface class IRemoteQuoteRepository {
  Future<Quote> get();
}