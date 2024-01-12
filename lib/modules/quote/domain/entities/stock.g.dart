// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      stock: json['stock'] as String,
      name: json['name'] as String,
      close: (json['close'] as num?)?.toDouble(),
      change: (json['change'] as num?)?.toDouble(),
      volume: json['volume'] as int?,
      marketCap: json['market_cap'] as int?,
      logo: json['logo'] as String?,
      sector: json['sector'] as String?,
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'stock': instance.stock,
      'name': instance.name,
      'close': instance.close,
      'change': instance.change,
      'volume': instance.volume,
      'market_cap': instance.marketCap,
      'logo': instance.logo,
      'sector': instance.sector,
    };
