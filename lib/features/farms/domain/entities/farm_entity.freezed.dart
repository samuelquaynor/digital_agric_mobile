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
  String get id => throw _privateConstructorUsedError;

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
  $Res call({@HiveField(0) String id});
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
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({@HiveField(0) String id});
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
  }) {
    return _then(_$_FarmEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_FarmEntity implements _FarmEntity {
  const _$_FarmEntity({@HiveField(0) required this.id});

  factory _$_FarmEntity.fromJson(Map<String, dynamic> json) =>
      _$$_FarmEntityFromJson(json);

  @override
  @HiveField(0)
  final String id;

  @override
  String toString() {
    return 'FarmEntity(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FarmEntity &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

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
  const factory _FarmEntity({@HiveField(0) required final String id}) =
      _$_FarmEntity;

  factory _FarmEntity.fromJson(Map<String, dynamic> json) =
      _$_FarmEntity.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FarmEntityCopyWith<_$_FarmEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
