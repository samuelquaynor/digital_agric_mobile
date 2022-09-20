// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  /// primary key
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;

  /// Email Address
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;

  /// Full Name
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;

  /// Farms
  @JsonKey(
      name: 'farms',
      defaultValue: <FarmEntity>[],
      fromJson: _farmEntityFromJson)
  @HiveField(5)
  List<FarmEntity> get farms => throw _privateConstructorUsedError;

  /// Tasks
  @JsonKey(
      name: 'tasks',
      defaultValue: <TasksEntity>[],
      fromJson: _tasksEntityFromJson)
  @HiveField(6)
  List<TasksEntity> get tasks => throw _privateConstructorUsedError;

  /// Tasks
  @JsonKey(
      name: 'orders',
      defaultValue: <OrderEntity>[],
      fromJson: _orderEntityFromJson)
  @HiveField(7)
  List<OrderEntity> get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String email,
      @HiveField(2)
          String name,
      @JsonKey(
          name: 'farms',
          defaultValue: <FarmEntity>[],
          fromJson: _farmEntityFromJson)
      @HiveField(5)
          List<FarmEntity> farms,
      @JsonKey(
          name: 'tasks',
          defaultValue: <TasksEntity>[],
          fromJson: _tasksEntityFromJson)
      @HiveField(6)
          List<TasksEntity> tasks,
      @JsonKey(
          name: 'orders',
          defaultValue: <OrderEntity>[],
          fromJson: _orderEntityFromJson)
      @HiveField(7)
          List<OrderEntity> orders});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res> implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  final UserEntity _value;
  // ignore: unused_field
  final $Res Function(UserEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? farms = freezed,
    Object? tasks = freezed,
    Object? orders = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      farms: farms == freezed
          ? _value.farms
          : farms // ignore: cast_nullable_to_non_nullable
              as List<FarmEntity>,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TasksEntity>,
      orders: orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderEntity>,
    ));
  }
}

/// @nodoc
abstract class _$$_UserEntityCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$_UserEntityCopyWith(
          _$_UserEntity value, $Res Function(_$_UserEntity) then) =
      __$$_UserEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0)
          String id,
      @HiveField(1)
          String email,
      @HiveField(2)
          String name,
      @JsonKey(
          name: 'farms',
          defaultValue: <FarmEntity>[],
          fromJson: _farmEntityFromJson)
      @HiveField(5)
          List<FarmEntity> farms,
      @JsonKey(
          name: 'tasks',
          defaultValue: <TasksEntity>[],
          fromJson: _tasksEntityFromJson)
      @HiveField(6)
          List<TasksEntity> tasks,
      @JsonKey(
          name: 'orders',
          defaultValue: <OrderEntity>[],
          fromJson: _orderEntityFromJson)
      @HiveField(7)
          List<OrderEntity> orders});
}

/// @nodoc
class __$$_UserEntityCopyWithImpl<$Res> extends _$UserEntityCopyWithImpl<$Res>
    implements _$$_UserEntityCopyWith<$Res> {
  __$$_UserEntityCopyWithImpl(
      _$_UserEntity _value, $Res Function(_$_UserEntity) _then)
      : super(_value, (v) => _then(v as _$_UserEntity));

  @override
  _$_UserEntity get _value => super._value as _$_UserEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? farms = freezed,
    Object? tasks = freezed,
    Object? orders = freezed,
  }) {
    return _then(_$_UserEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      farms: farms == freezed
          ? _value._farms
          : farms // ignore: cast_nullable_to_non_nullable
              as List<FarmEntity>,
      tasks: tasks == freezed
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TasksEntity>,
      orders: orders == freezed
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserEntity implements _UserEntity {
  const _$_UserEntity(
      {@HiveField(0)
          required this.id,
      @HiveField(1)
          required this.email,
      @HiveField(2)
          required this.name,
      @JsonKey(
          name: 'farms',
          defaultValue: <FarmEntity>[],
          fromJson: _farmEntityFromJson)
      @HiveField(5)
          required final List<FarmEntity> farms,
      @JsonKey(
          name: 'tasks',
          defaultValue: <TasksEntity>[],
          fromJson: _tasksEntityFromJson)
      @HiveField(6)
          required final List<TasksEntity> tasks,
      @JsonKey(
          name: 'orders',
          defaultValue: <OrderEntity>[],
          fromJson: _orderEntityFromJson)
      @HiveField(7)
          required final List<OrderEntity> orders})
      : _farms = farms,
        _tasks = tasks,
        _orders = orders;

  factory _$_UserEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserEntityFromJson(json);

  /// primary key
  @override
  @HiveField(0)
  final String id;

  /// Email Address
  @override
  @HiveField(1)
  final String email;

  /// Full Name
  @override
  @HiveField(2)
  final String name;

  /// Farms
  final List<FarmEntity> _farms;

  /// Farms
  @override
  @JsonKey(
      name: 'farms',
      defaultValue: <FarmEntity>[],
      fromJson: _farmEntityFromJson)
  @HiveField(5)
  List<FarmEntity> get farms {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_farms);
  }

  /// Tasks
  final List<TasksEntity> _tasks;

  /// Tasks
  @override
  @JsonKey(
      name: 'tasks',
      defaultValue: <TasksEntity>[],
      fromJson: _tasksEntityFromJson)
  @HiveField(6)
  List<TasksEntity> get tasks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  /// Tasks
  final List<OrderEntity> _orders;

  /// Tasks
  @override
  @JsonKey(
      name: 'orders',
      defaultValue: <OrderEntity>[],
      fromJson: _orderEntityFromJson)
  @HiveField(7)
  List<OrderEntity> get orders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, name: $name, farms: $farms, tasks: $tasks, orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._farms, _farms) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_farms),
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  _$$_UserEntityCopyWith<_$_UserEntity> get copyWith =>
      __$$_UserEntityCopyWithImpl<_$_UserEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEntityToJson(this);
  }
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {@HiveField(0)
          required final String id,
      @HiveField(1)
          required final String email,
      @HiveField(2)
          required final String name,
      @JsonKey(
          name: 'farms',
          defaultValue: <FarmEntity>[],
          fromJson: _farmEntityFromJson)
      @HiveField(5)
          required final List<FarmEntity> farms,
      @JsonKey(
          name: 'tasks',
          defaultValue: <TasksEntity>[],
          fromJson: _tasksEntityFromJson)
      @HiveField(6)
          required final List<TasksEntity> tasks,
      @JsonKey(
          name: 'orders',
          defaultValue: <OrderEntity>[],
          fromJson: _orderEntityFromJson)
      @HiveField(7)
          required final List<OrderEntity> orders}) = _$_UserEntity;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$_UserEntity.fromJson;

  @override

  /// primary key
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override

  /// Email Address
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @override

  /// Full Name
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @override

  /// Farms
  @JsonKey(
      name: 'farms',
      defaultValue: <FarmEntity>[],
      fromJson: _farmEntityFromJson)
  @HiveField(5)
  List<FarmEntity> get farms => throw _privateConstructorUsedError;
  @override

  /// Tasks
  @JsonKey(
      name: 'tasks',
      defaultValue: <TasksEntity>[],
      fromJson: _tasksEntityFromJson)
  @HiveField(6)
  List<TasksEntity> get tasks => throw _privateConstructorUsedError;
  @override

  /// Tasks
  @JsonKey(
      name: 'orders',
      defaultValue: <OrderEntity>[],
      fromJson: _orderEntityFromJson)
  @HiveField(7)
  List<OrderEntity> get orders => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserEntityCopyWith<_$_UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
