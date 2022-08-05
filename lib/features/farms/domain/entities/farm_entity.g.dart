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
      id: fields[0] as String?,
      name: fields[1] as String,
      soilType: fields[2] as String,
      farmSize: fields[3] as double,
      longitude: fields[4] as double,
      latitude: fields[5] as double,
      crops: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, FarmEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.soilType)
      ..writeByte(3)
      ..write(obj.farmSize)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.latitude)
      ..writeByte(6)
      ..write(obj.crops);
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
      id: json['id'] as String?,
      name: json['name'] as String,
      soilType: json['soilType'] as String,
      farmSize: (json['farmSize'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      crops: (json['crops'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FarmEntityToJson(_$_FarmEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'soilType': instance.soilType,
      'farmSize': instance.farmSize,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'crops': instance.crops,
    };
