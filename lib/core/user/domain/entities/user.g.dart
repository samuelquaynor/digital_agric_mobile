// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 0;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      id: fields[0] as String,
      email: fields[1] as String,
      name: fields[2] as String,
      phoneNumber: fields[3] as String?,
      avatar: fields[8] as String?,
      password: fields[4] as String?,
      farms: (fields[5] as List).cast<FarmEntity>(),
      tasks: (fields[6] as List).cast<TasksEntity>(),
      orders: (fields[7] as List).cast<OrderEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.farms)
      ..writeByte(6)
      ..write(obj.tasks)
      ..writeByte(7)
      ..write(obj.orders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      avatar: json['avatar'] as String?,
      password: json['password'] as String?,
      farms: json['farms'] == null
          ? []
          : _farmEntityFromJson(json['farms'] as List?),
      tasks: json['tasks'] == null
          ? []
          : _tasksEntityFromJson(json['tasks'] as List?),
      orders: json['orders'] == null
          ? []
          : _orderEntityFromJson(json['orders'] as List?),
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'avatar': instance.avatar,
      'password': instance.password,
      'farms': instance.farms.map((e) => e.toJson()).toList(),
      'tasks': instance.tasks.map((e) => e.toJson()).toList(),
      'orders': instance.orders.map((e) => e.toJson()).toList(),
    };
