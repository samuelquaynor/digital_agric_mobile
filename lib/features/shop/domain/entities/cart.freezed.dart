// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  double get initialPrice => throw _privateConstructorUsedError;
  @HiveField(2)
  double get totalPrice => throw _privateConstructorUsedError;
  @HiveField(3)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(4)
  Product? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) double initialPrice,
      @HiveField(2) double totalPrice,
      @HiveField(3) int quantity,
      @HiveField(4) Product? product});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  final Cart _value;
  // ignore: unused_field
  final $Res Function(Cart) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? initialPrice = freezed,
    Object? totalPrice = freezed,
    Object? quantity = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      initialPrice: initialPrice == freezed
          ? _value.initialPrice
          : initialPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }

  @override
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$$_CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$_CartCopyWith(_$_Cart value, $Res Function(_$_Cart) then) =
      __$$_CartCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) double initialPrice,
      @HiveField(2) double totalPrice,
      @HiveField(3) int quantity,
      @HiveField(4) Product? product});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$_CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res>
    implements _$$_CartCopyWith<$Res> {
  __$$_CartCopyWithImpl(_$_Cart _value, $Res Function(_$_Cart) _then)
      : super(_value, (v) => _then(v as _$_Cart));

  @override
  _$_Cart get _value => super._value as _$_Cart;

  @override
  $Res call({
    Object? id = freezed,
    Object? initialPrice = freezed,
    Object? totalPrice = freezed,
    Object? quantity = freezed,
    Object? product = freezed,
  }) {
    return _then(_$_Cart(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      initialPrice: initialPrice == freezed
          ? _value.initialPrice
          : initialPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: totalPrice == freezed
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Cart implements _Cart {
  const _$_Cart(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.initialPrice,
      @HiveField(2) required this.totalPrice,
      @HiveField(3) required this.quantity,
      @HiveField(4) this.product});

  factory _$_Cart.fromJson(Map<String, dynamic> json) => _$$_CartFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final double initialPrice;
  @override
  @HiveField(2)
  final double totalPrice;
  @override
  @HiveField(3)
  final int quantity;
  @override
  @HiveField(4)
  final Product? product;

  @override
  String toString() {
    return 'Cart(id: $id, initialPrice: $initialPrice, totalPrice: $totalPrice, quantity: $quantity, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cart &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.initialPrice, initialPrice) &&
            const DeepCollectionEquality()
                .equals(other.totalPrice, totalPrice) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(initialPrice),
      const DeepCollectionEquality().hash(totalPrice),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$$_CartCopyWith<_$_Cart> get copyWith =>
      __$$_CartCopyWithImpl<_$_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartToJson(this);
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {@HiveField(0) required final String id,
      @HiveField(1) required final double initialPrice,
      @HiveField(2) required final double totalPrice,
      @HiveField(3) required final int quantity,
      @HiveField(4) final Product? product}) = _$_Cart;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  double get initialPrice => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  double get totalPrice => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  int get quantity => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  Product? get product => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CartCopyWith<_$_Cart> get copyWith => throw _privateConstructorUsedError;
}
