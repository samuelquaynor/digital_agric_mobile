import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/hive_adapters.dart';
import 'product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

/// Cart Entity
@HiveType(typeId: HiveAdapters.cart)
@freezed
class Cart with _$Cart {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory Cart(
      {@HiveField(0) required String id,
      @HiveField(1) required double initialPrice,
      @HiveField(2) required double totalPrice,
      @HiveField(3) required int quantity,
      @HiveField(4) Product? product}) = _Cart;

  /// Initial state with default values
  factory Cart.initial() =>
      const Cart(id: '', quantity: 0, totalPrice: 0, initialPrice: 0);

  /// Convert from json to model
  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
