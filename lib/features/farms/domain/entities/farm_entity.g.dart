// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FarmEntityAdapter extends TypeAdapter<FarmEntity> {
  @override
  final int typeId = 3;

  @override
  FarmEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FarmEntity(
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FarmEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FarmEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmEntity _$$_FarmEntityFromJson(Map<String, dynamic> json) =>
    _$_FarmEntity(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_FarmEntityToJson(_$_FarmEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
