// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'plant_disease_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlantDiseaseEntity _$PlantDiseaseEntityFromJson(Map<String, dynamic> json) {
  return _PlantDiseaseEntity.fromJson(json);
}

/// @nodoc
mixin _$PlantDiseaseEntity {
  String get disease => throw _privateConstructorUsedError;
  String get plant => throw _privateConstructorUsedError;
  String get remedy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantDiseaseEntityCopyWith<PlantDiseaseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantDiseaseEntityCopyWith<$Res> {
  factory $PlantDiseaseEntityCopyWith(
          PlantDiseaseEntity value, $Res Function(PlantDiseaseEntity) then) =
      _$PlantDiseaseEntityCopyWithImpl<$Res>;
  $Res call({String disease, String plant, String remedy});
}

/// @nodoc
class _$PlantDiseaseEntityCopyWithImpl<$Res>
    implements $PlantDiseaseEntityCopyWith<$Res> {
  _$PlantDiseaseEntityCopyWithImpl(this._value, this._then);

  final PlantDiseaseEntity _value;
  // ignore: unused_field
  final $Res Function(PlantDiseaseEntity) _then;

  @override
  $Res call({
    Object? disease = freezed,
    Object? plant = freezed,
    Object? remedy = freezed,
  }) {
    return _then(_value.copyWith(
      disease: disease == freezed
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      plant: plant == freezed
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      remedy: remedy == freezed
          ? _value.remedy
          : remedy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PlantDiseaseEntityCopyWith<$Res>
    implements $PlantDiseaseEntityCopyWith<$Res> {
  factory _$$_PlantDiseaseEntityCopyWith(_$_PlantDiseaseEntity value,
          $Res Function(_$_PlantDiseaseEntity) then) =
      __$$_PlantDiseaseEntityCopyWithImpl<$Res>;
  @override
  $Res call({String disease, String plant, String remedy});
}

/// @nodoc
class __$$_PlantDiseaseEntityCopyWithImpl<$Res>
    extends _$PlantDiseaseEntityCopyWithImpl<$Res>
    implements _$$_PlantDiseaseEntityCopyWith<$Res> {
  __$$_PlantDiseaseEntityCopyWithImpl(
      _$_PlantDiseaseEntity _value, $Res Function(_$_PlantDiseaseEntity) _then)
      : super(_value, (v) => _then(v as _$_PlantDiseaseEntity));

  @override
  _$_PlantDiseaseEntity get _value => super._value as _$_PlantDiseaseEntity;

  @override
  $Res call({
    Object? disease = freezed,
    Object? plant = freezed,
    Object? remedy = freezed,
  }) {
    return _then(_$_PlantDiseaseEntity(
      disease: disease == freezed
          ? _value.disease
          : disease // ignore: cast_nullable_to_non_nullable
              as String,
      plant: plant == freezed
          ? _value.plant
          : plant // ignore: cast_nullable_to_non_nullable
              as String,
      remedy: remedy == freezed
          ? _value.remedy
          : remedy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PlantDiseaseEntity implements _PlantDiseaseEntity {
  const _$_PlantDiseaseEntity(
      {required this.disease, required this.plant, required this.remedy});

  factory _$_PlantDiseaseEntity.fromJson(Map<String, dynamic> json) =>
      _$$_PlantDiseaseEntityFromJson(json);

  @override
  final String disease;
  @override
  final String plant;
  @override
  final String remedy;

  @override
  String toString() {
    return 'PlantDiseaseEntity(disease: $disease, plant: $plant, remedy: $remedy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlantDiseaseEntity &&
            const DeepCollectionEquality().equals(other.disease, disease) &&
            const DeepCollectionEquality().equals(other.plant, plant) &&
            const DeepCollectionEquality().equals(other.remedy, remedy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(disease),
      const DeepCollectionEquality().hash(plant),
      const DeepCollectionEquality().hash(remedy));

  @JsonKey(ignore: true)
  @override
  _$$_PlantDiseaseEntityCopyWith<_$_PlantDiseaseEntity> get copyWith =>
      __$$_PlantDiseaseEntityCopyWithImpl<_$_PlantDiseaseEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlantDiseaseEntityToJson(this);
  }
}

abstract class _PlantDiseaseEntity implements PlantDiseaseEntity {
  const factory _PlantDiseaseEntity(
      {required final String disease,
      required final String plant,
      required final String remedy}) = _$_PlantDiseaseEntity;

  factory _PlantDiseaseEntity.fromJson(Map<String, dynamic> json) =
      _$_PlantDiseaseEntity.fromJson;

  @override
  String get disease => throw _privateConstructorUsedError;
  @override
  String get plant => throw _privateConstructorUsedError;
  @override
  String get remedy => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PlantDiseaseEntityCopyWith<_$_PlantDiseaseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
