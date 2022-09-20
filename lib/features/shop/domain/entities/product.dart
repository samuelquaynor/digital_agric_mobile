import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/hive_adapters.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Product Entity
@HiveType(typeId: HiveAdapters.product)
@freezed
class Product with _$Product {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory Product(
      {@HiveField(0) required int id,
      @HiveField(1) required String description,
      @HiveField(2) required String name,
      @HiveField(3) required String seller,
      @HiveField(4) required String photoUrl,
      @HiveField(5) required double price,
      @HiveField(6) required double quantity}) = _Product;

  /// Initial state with default values
  factory Product.initial() => const Product(
      id: 0,
      description: '',
      name: '',
      photoUrl: '',
      price: 0,
      quantity: 0,
      seller: '');

  /// Convert from json to model
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
