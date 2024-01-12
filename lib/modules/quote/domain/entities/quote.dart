import 'package:equatable/equatable.dart';
import 'package:investapp/modules/quote/domain/entities/stock.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:investapp/modules/quote/domain/entities/index.dart';

part 'quote.g.dart';

@JsonSerializable()
final class Quote extends Equatable {
  final List<Index> indexes;
  final List<Stock> stocks;

  const Quote({required this.indexes, required this.stocks});

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  @override
  List<Object?> get props => [indexes, stocks];
}
