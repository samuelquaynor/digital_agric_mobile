import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/hive_adapters.dart';
import 'cart.dart';

part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

/// Order Entity
@HiveType(typeId: HiveAdapters.order)
@freezed
class OrderEntity with _$OrderEntity {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory OrderEntity(
      {@HiveField(0)
          required String id,
      @HiveField(1)
          required DateTime createdAt,
      @HiveField(2)
          required String userId,
      @HiveField(4)
          required double totalPrice,
      @HiveField(5)
          required double deliveryPrice,
      @HiveField(6)
          required double destinationLongitude,
      @HiveField(7)
          required double destinationLatitude,
      @HiveField(8)
          required String destinationName,
      @JsonKey(name: 'items', defaultValue: <Cart>[], fromJson: _cartFromJson)
      @HiveField(3)
          required List<Cart> carts}) = _Order;

  /// Initial state with default values
  factory OrderEntity.initial() => OrderEntity(
      id: '',
      carts: [],
      createdAt: DateTime.now(),
      userId: '',
      totalPrice: 0,
      deliveryPrice: 0,
      destinationLatitude: 0,
      destinationLongitude: 0,
      destinationName: '');

  /// Convert from json to model
  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);
}

List<Cart> _cartFromJson(List<dynamic> json) {
  return json.cast<Map<String, dynamic>>().map<Cart>(Cart.fromJson).toList();
}
