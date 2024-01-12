import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
final class Stock extends Equatable {
  final String stock;
  final String name;
  final double? close;
  final double? change;
  final int? volume;
  final int? marketCap;
  final String? logo;
  final String? sector;

  const Stock({
    required this.stock,
    required this.name,
    required this.close,
    required this.change,
    required this.volume,
    required this.marketCap,
    required this.logo,
    required this.sector,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  @override
  List<Object?> get props => [stock, name, close, change, volume, marketCap, logo, sector];
}
