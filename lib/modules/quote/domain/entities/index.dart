import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
final class Index extends Equatable {
  final String stock;
  final String name;

  const Index({required this.stock, required this.name});

  factory Index.fromJson(Map<String, dynamic> json) => _$IndexFromJson(json);

  @override
  List<Object?> get props => [stock, name];
}