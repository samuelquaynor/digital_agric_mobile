// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksEntityAdapter extends TypeAdapter<TasksEntity> {
  @override
  final int typeId = 4;

  @override
  TasksEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasksEntity(
      id: fields[0] as String?,
      name: fields[1] as String,
      description: fields[2] as String,
      startTime: fields[3] as String,
      endTime: fields[4] as String,
      farms: (fields[6] as List).cast<dynamic>(),
      status: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TasksEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.startTime)
      ..writeByte(4)
      ..write(obj.endTime)
      ..writeByte(6)
      ..write(obj.farms)
      ..writeByte(7)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TasksEntity _$$_TasksEntityFromJson(Map<String, dynamic> json) =>
    _$_TasksEntity(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      farms: json['farms'] as List<dynamic>,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_TasksEntityToJson(_$_TasksEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'farms': instance.farms,
      'status': instance.status,
    };
