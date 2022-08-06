// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tasks_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TasksEntity _$TasksEntityFromJson(Map<String, dynamic> json) {
  return _TasksEntity.fromJson(json);
}

/// @nodoc
mixin _$TasksEntity {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String get startTime => throw _privateConstructorUsedError;
  @HiveField(4)
  String get endTime => throw _privateConstructorUsedError;
  @HiveField(6)
  List<dynamic> get farms => throw _privateConstructorUsedError;
  @HiveField(7)
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TasksEntityCopyWith<TasksEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksEntityCopyWith<$Res> {
  factory $TasksEntityCopyWith(
          TasksEntity value, $Res Function(TasksEntity) then) =
      _$TasksEntityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String startTime,
      @HiveField(4) String endTime,
      @HiveField(6) List<dynamic> farms,
      @HiveField(7) String status});
}

/// @nodoc
class _$TasksEntityCopyWithImpl<$Res> implements $TasksEntityCopyWith<$Res> {
  _$TasksEntityCopyWithImpl(this._value, this._then);

  final TasksEntity _value;
  // ignore: unused_field
  final $Res Function(TasksEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? farms = freezed,
    Object? status = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      farms: farms == freezed
          ? _value.farms
          : farms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TasksEntityCopyWith<$Res>
    implements $TasksEntityCopyWith<$Res> {
  factory _$$_TasksEntityCopyWith(
          _$_TasksEntity value, $Res Function(_$_TasksEntity) then) =
      __$$_TasksEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) String startTime,
      @HiveField(4) String endTime,
      @HiveField(6) List<dynamic> farms,
      @HiveField(7) String status});
}

/// @nodoc
class __$$_TasksEntityCopyWithImpl<$Res> extends _$TasksEntityCopyWithImpl<$Res>
    implements _$$_TasksEntityCopyWith<$Res> {
  __$$_TasksEntityCopyWithImpl(
      _$_TasksEntity _value, $Res Function(_$_TasksEntity) _then)
      : super(_value, (v) => _then(v as _$_TasksEntity));

  @override
  _$_TasksEntity get _value => super._value as _$_TasksEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? farms = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_TasksEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      farms: farms == freezed
          ? _value._farms
          : farms // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TasksEntity implements _TasksEntity {
  const _$_TasksEntity(
      {@HiveField(0) this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.description,
      @HiveField(3) required this.startTime,
      @HiveField(4) required this.endTime,
      @HiveField(6) required final List<dynamic> farms,
      @HiveField(7) required this.status})
      : _farms = farms;

  factory _$_TasksEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TasksEntityFromJson(json);

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final String startTime;
  @override
  @HiveField(4)
  final String endTime;
  final List<dynamic> _farms;
  @override
  @HiveField(6)
  List<dynamic> get farms {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_farms);
  }

  @override
  @HiveField(7)
  final String status;

  @override
  String toString() {
    return 'TasksEntity(id: $id, name: $name, description: $description, startTime: $startTime, endTime: $endTime, farms: $farms, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TasksEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality().equals(other._farms, _farms) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime),
      const DeepCollectionEquality().hash(_farms),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_TasksEntityCopyWith<_$_TasksEntity> get copyWith =>
      __$$_TasksEntityCopyWithImpl<_$_TasksEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TasksEntityToJson(this);
  }
}

abstract class _TasksEntity implements TasksEntity {
  const factory _TasksEntity(
      {@HiveField(0) final String? id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String description,
      @HiveField(3) required final String startTime,
      @HiveField(4) required final String endTime,
      @HiveField(6) required final List<dynamic> farms,
      @HiveField(7) required final String status}) = _$_TasksEntity;

  factory _TasksEntity.fromJson(Map<String, dynamic> json) =
      _$_TasksEntity.fromJson;

  @override
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get startTime => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String get endTime => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  List<dynamic> get farms => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  String get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TasksEntityCopyWith<_$_TasksEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
