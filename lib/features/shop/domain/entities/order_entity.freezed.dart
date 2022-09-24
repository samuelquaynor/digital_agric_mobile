// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$OrderEntity {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(2)
  String get userId => throw _privateConstructorUsedError;
  @HiveField(4)
  double get totalPrice => throw _privateConstructorUsedError;
  @HiveField(5)
  double get deliveryPrice => throw _privateConstructorUsedError;
  @HiveField(6)
  double get destinationLongitude => throw _privateConstructorUsedError;
  @HiveField(7)
  double get destinationLatitude => throw _privateConstructorUsedError;
  @HiveField(8)
  String get destinationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'items', defaultValue: <Cart>[], fromJson: _cartFromJson)
  @HiveField(3)
  List<Cart?> get carts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderEntityCopyWith<OrderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEntityCopyWith<$Res> {
  factory $OrderEntityCopyWith(
          OrderEntity value, $Res Function(OrderEntity) then) =
      _$OrderEntityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          DateTime createdAt,
      @HiveField(2)
          String userId,
      @HiveField(4)
          double totalPrice,
      @HiveField(5)
          double deliveryPrice,
      @HiveField(6)
          double destinationLongitude,
      @HiveField(7)
          double destinationLatitude,
      @HiveField(8)
          String destinationName,
      @JsonKey(name: 'items', defaultValue: <Cart>[], fromJson: _cartFromJson)
      @HiveField(3)
          List<Cart?> carts});
}

/// @nodoc
class _$OrderEntityCopyWithImpl<$Res> implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._value, this._then);

  final OrderEntity _value;
  // ignore: unused_field
  final $Res Function(OrderEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? totalPrice = freezed,
    Object? deliveryPrice = freezed,
    Object? destinationLongitude = freezed,
    Object? destinationLatitude = freezed,
    Object? destinationName = freezed,
    Object? carts = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryPrice: deliveryPrice == freezed
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLongitude: destinationLongitude == freezed
          ? _value.destinationLongitude
          : destinationLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLatitude: destinationLatitude == freezed
          ? _value.destinationLatitude
          : destinationLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      destinationName: destinationName == freezed
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String,
      carts: carts == freezed
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Cart?>,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderEntityCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          DateTime createdAt,
      @HiveField(2)
          String userId,
      @HiveField(4)
          double totalPrice,
      @HiveField(5)
          double deliveryPrice,
      @HiveField(6)
          double destinationLongitude,
      @HiveField(7)
          double destinationLatitude,
      @HiveField(8)
          String destinationName,
      @JsonKey(name: 'items', defaultValue: <Cart>[], fromJson: _cartFromJson)
      @HiveField(3)
          List<Cart?> carts});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderEntityCopyWithImpl<$Res>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, (v) => _then(v as _$_Order));

  @override
  _$_Order get _value => super._value as _$_Order;

  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? totalPrice = freezed,
    Object? deliveryPrice = freezed,
    Object? destinationLongitude = freezed,
    Object? destinationLatitude = freezed,
    Object? destinationName = freezed,
    Object? carts = freezed,
  }) {
    return _then(_$_Order(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryPrice: deliveryPrice == freezed
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLongitude: destinationLongitude == freezed
          ? _value.destinationLongitude
          : destinationLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      destinationLatitude: destinationLatitude == freezed
          ? _value.destinationLatitude
          : destinationLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      destinationName: destinationName == freezed
          ? _value.destinationName
          : destinationName // ignore: cast_nullable_to_non_nullable
              as String,
      carts: carts == freezed
          ? _value._carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Cart?>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Order implements _Order {
  const _$_Order(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.createdAt,
      @HiveField(2)
          required this.userId,
      @HiveField(4)
          required this.totalPrice,
      @HiveField(5)
          required this.deliveryPrice,
      @HiveField(6)
          required this.destinationLongitude,
      @HiveField(7)
          required this.destinationLatitude,
      @HiveField(8)
          required this.destinationName,
      @JsonKey(name: 'items', defaultValue: <Cart>[], fromJson: _cartFromJson)
      @HiveField(3)
          required final List<Cart?> carts})
      : _carts = carts;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final DateTime createdAt;
  @override
  @HiveField(2)
  final String userId;
  @override
  @HiveField(4)
  final double totalPrice;
  @override
  @HiveField(5)
  final double deliveryPrice;
  @override
  @HiveField(6)
  final double destinationLongitude;
  @override
  @HiveField(7)
  final double destinationLatitude;
  @override
  @HiveField(8)
  final String destinationName;
  final List<Cart?> _carts;
  @override
  @JsonKey(name: 'items', defaultValue: <Cart>[], fromJson: _cartFromJson)
  @HiveField(3)
  List<Cart?> get carts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carts);
  }

  @override
  String toString() {
    return 'OrderEntity(id: $id, createdAt: $createdAt, userId: $userId, totalPrice: $totalPrice, deliveryPrice: $deliveryPrice, destinationLongitude: $destinationLongitude, destinationLatitude: $destinationLatitude, destinationName: $destinationName, carts: $carts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            const DeepCollectionEquality()
                .equals(other.deliveryPrice, deliveryPrice) &&
            const DeepCollectionEquality()
                .equals(other.destinationLongitude, destinationLongitude) &&
            const DeepCollectionEquality()
                .equals(other.destinationLatitude, destinationLatitude) &&
            const DeepCollectionEquality()
                .equals(other.destinationName, destinationName) &&
            const DeepCollectionEquality().equals(other._carts, _carts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(totalPrice),
      const DeepCollectionEquality().hash(deliveryPrice),
      const DeepCollectionEquality().hash(destinationLongitude),
      const DeepCollectionEquality().hash(destinationLatitude),
      const DeepCollectionEquality().hash(destinationName),
      const DeepCollectionEquality().hash(_carts));

  @JsonKey(ignore: true)
  @override
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(this);
  }
}

abstract class _Order implements OrderEntity {
  const factory _Order(
      {@HiveField(0)
          required final String id,
      @HiveField(1)
          required final DateTime createdAt,
      @HiveField(2)
          required final String userId,
      @HiveField(4)
          required final double totalPrice,
      @HiveField(5)
          required final double deliveryPrice,
      @HiveField(6)
          required final double destinationLongitude,
      @HiveField(7)
          required final double destinationLatitude,
      @HiveField(8)
          required final String destinationName,
      @JsonKey(name: 'items', defaultValue: <Cart>[], fromJson: _cartFromJson)
      @HiveField(3)
          required final List<Cart?> carts}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get userId => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  double get totalPrice => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  double get deliveryPrice => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  double get destinationLongitude => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  double get destinationLatitude => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  String get destinationName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'items', defaultValue: <Cart>[], fromJson: _cartFromJson)
  @HiveField(3)
  List<Cart?> get carts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
