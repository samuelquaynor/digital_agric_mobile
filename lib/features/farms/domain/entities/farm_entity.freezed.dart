// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'farm_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FarmEntity _$FarmEntityFromJson(Map<String, dynamic> json) {
  return _FarmEntity.fromJson(json);
}

/// @nodoc
mixin _$FarmEntity {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get soilType => throw _privateConstructorUsedError;
  @HiveField(3)
  double get farmSize => throw _privateConstructorUsedError;
  @HiveField(4)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(5)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'crops', defaultValue: <CropInfo>[], fromJson: _cropsFromJson)
  @HiveField(6)
  List<CropInfo?> get crops => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarmEntityCopyWith<FarmEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmEntityCopyWith<$Res> {
  factory $FarmEntityCopyWith(
          FarmEntity value, $Res Function(FarmEntity) then) =
      _$FarmEntityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String? id,
      @HiveField(1)
          String name,
      @HiveField(2)
          String soilType,
      @HiveField(3)
          double farmSize,
      @HiveField(4)
          double longitude,
      @HiveField(5)
          double latitude,
      @HiveField(7)
          String? avatar,
      @JsonKey(
          name: 'crops', defaultValue: <CropInfo>[], fromJson: _cropsFromJson)
      @HiveField(6)
          List<CropInfo?> crops});
}

/// @nodoc
class _$FarmEntityCopyWithImpl<$Res> implements $FarmEntityCopyWith<$Res> {
  _$FarmEntityCopyWithImpl(this._value, this._then);

  final FarmEntity _value;
  // ignore: unused_field
  final $Res Function(FarmEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? soilType = freezed,
    Object? farmSize = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? avatar = freezed,
    Object? crops = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      soilType: soilType == freezed
          ? _value.soilType
          : soilType // ignore: cast_nullable_to_non_nullable
              as String,
      farmSize: farmSize == freezed
          ? _value.farmSize
          : farmSize // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      crops: crops == freezed
          ? _value.crops
          : crops // ignore: cast_nullable_to_non_nullable
              as List<CropInfo?>,
    ));
  }
}

/// @nodoc
abstract class _$$_FarmEntityCopyWith<$Res>
    implements $FarmEntityCopyWith<$Res> {
  factory _$$_FarmEntityCopyWith(
          _$_FarmEntity value, $Res Function(_$_FarmEntity) then) =
      __$$_FarmEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String? id,
      @HiveField(1)
          String name,
      @HiveField(2)
          String soilType,
      @HiveField(3)
          double farmSize,
      @HiveField(4)
          double longitude,
      @HiveField(5)
          double latitude,
      @HiveField(7)
          String? avatar,
      @JsonKey(
          name: 'crops', defaultValue: <CropInfo>[], fromJson: _cropsFromJson)
      @HiveField(6)
          List<CropInfo?> crops});
}

/// @nodoc
class __$$_FarmEntityCopyWithImpl<$Res> extends _$FarmEntityCopyWithImpl<$Res>
    implements _$$_FarmEntityCopyWith<$Res> {
  __$$_FarmEntityCopyWithImpl(
      _$_FarmEntity _value, $Res Function(_$_FarmEntity) _then)
      : super(_value, (v) => _then(v as _$_FarmEntity));

  @override
  _$_FarmEntity get _value => super._value as _$_FarmEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? soilType = freezed,
    Object? farmSize = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? avatar = freezed,
    Object? crops = freezed,
  }) {
    return _then(_$_FarmEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      soilType: soilType == freezed
          ? _value.soilType
          : soilType // ignore: cast_nullable_to_non_nullable
              as String,
      farmSize: farmSize == freezed
          ? _value.farmSize
          : farmSize // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      crops: crops == freezed
          ? _value._crops
          : crops // ignore: cast_nullable_to_non_nullable
              as List<CropInfo?>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FarmEntity implements _FarmEntity {
  const _$_FarmEntity(
      {@HiveField(0)
          this.id,
      @HiveField(1)
          required this.name,
      @HiveField(2)
          required this.soilType,
      @HiveField(3)
          required this.farmSize,
      @HiveField(4)
          required this.longitude,
      @HiveField(5)
          required this.latitude,
      @HiveField(7)
          this.avatar,
      @JsonKey(
          name: 'crops', defaultValue: <CropInfo>[], fromJson: _cropsFromJson)
      @HiveField(6)
          required final List<CropInfo?> crops})
      : _crops = crops;

  factory _$_FarmEntity.fromJson(Map<String, dynamic> json) =>
      _$$_FarmEntityFromJson(json);

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String soilType;
  @override
  @HiveField(3)
  final double farmSize;
  @override
  @HiveField(4)
  final double longitude;
  @override
  @HiveField(5)
  final double latitude;
  @override
  @HiveField(7)
  final String? avatar;
  final List<CropInfo?> _crops;
  @override
  @JsonKey(name: 'crops', defaultValue: <CropInfo>[], fromJson: _cropsFromJson)
  @HiveField(6)
  List<CropInfo?> get crops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crops);
  }

  @override
  String toString() {
    return 'FarmEntity(id: $id, name: $name, soilType: $soilType, farmSize: $farmSize, longitude: $longitude, latitude: $latitude, avatar: $avatar, crops: $crops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FarmEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.soilType, soilType) &&
            const DeepCollectionEquality().equals(other.farmSize, farmSize) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other._crops, _crops));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(soilType),
      const DeepCollectionEquality().hash(farmSize),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(_crops));

  @JsonKey(ignore: true)
  @override
  _$$_FarmEntityCopyWith<_$_FarmEntity> get copyWith =>
      __$$_FarmEntityCopyWithImpl<_$_FarmEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FarmEntityToJson(this);
  }
}

abstract class _FarmEntity implements FarmEntity {
  const factory _FarmEntity(
      {@HiveField(0)
          final String? id,
      @HiveField(1)
          required final String name,
      @HiveField(2)
          required final String soilType,
      @HiveField(3)
          required final double farmSize,
      @HiveField(4)
          required final double longitude,
      @HiveField(5)
          required final double latitude,
      @HiveField(7)
          final String? avatar,
      @JsonKey(
          name: 'crops', defaultValue: <CropInfo>[], fromJson: _cropsFromJson)
      @HiveField(6)
          required final List<CropInfo?> crops}) = _$_FarmEntity;

  factory _FarmEntity.fromJson(Map<String, dynamic> json) =
      _$_FarmEntity.fromJson;

  @override
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get soilType => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  double get farmSize => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  double get longitude => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  double get latitude => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  String? get avatar => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'crops', defaultValue: <CropInfo>[], fromJson: _cropsFromJson)
  @HiveField(6)
  List<CropInfo?> get crops => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FarmEntityCopyWith<_$_FarmEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
