// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CropInfoAdapter extends TypeAdapter<CropInfo> {
  @override
  final int typeId = 8;

  @override
  CropInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CropInfo(
      id: fields[0] as int,
      description: fields[1] as String?,
      name: fields[2] as String?,
      plantType: fields[3] as String?,
      flowerColor: fields[4] as String?,
      soilPH: fields[5] as String?,
      soilTemperature: fields[6] as String?,
      germinationPeriod: fields[7] as String?,
      bloomTime: fields[8] as String?,
      sunExposure: fields[9] as String?,
      daysToHarvest: fields[10] as int?,
      varieties: (fields[11] as List?)?.cast<String?>(),
      pests: (fields[12] as List?)?.cast<String?>(),
      diseases: (fields[13] as List?)?.cast<String?>(),
      learnMore: fields[14] as String?,
      photoUrl: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CropInfo obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.plantType)
      ..writeByte(4)
      ..write(obj.flowerColor)
      ..writeByte(5)
      ..write(obj.soilPH)
      ..writeByte(6)
      ..write(obj.soilTemperature)
      ..writeByte(7)
      ..write(obj.germinationPeriod)
      ..writeByte(8)
      ..write(obj.bloomTime)
      ..writeByte(9)
      ..write(obj.sunExposure)
      ..writeByte(10)
      ..write(obj.daysToHarvest)
      ..writeByte(11)
      ..write(obj.varieties)
      ..writeByte(12)
      ..write(obj.pests)
      ..writeByte(13)
      ..write(obj.diseases)
      ..writeByte(14)
      ..write(obj.learnMore)
      ..writeByte(15)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CropInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CropInfo _$$_CropInfoFromJson(Map<String, dynamic> json) => _$_CropInfo(
      id: json['id'] as int,
      description: json['description'] as String?,
      name: json['name'] as String?,
      plantType: json['plantType'] as String?,
      flowerColor: json['flowerColor'] as String?,
      soilPH: json['soilPH'] as String?,
      soilTemperature: json['soilTemperature'] as String?,
      germinationPeriod: json['germinationPeriod'] as String?,
      bloomTime: json['bloomTime'] as String?,
      sunExposure: json['sunExposure'] as String?,
      daysToHarvest: json['daysToHarvest'] as int?,
      varieties: (json['varieties'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      pests:
          (json['pests'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      diseases: (json['diseases'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      learnMore: json['learnMore'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$_CropInfoToJson(_$_CropInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'name': instance.name,
      'plantType': instance.plantType,
      'flowerColor': instance.flowerColor,
      'soilPH': instance.soilPH,
      'soilTemperature': instance.soilTemperature,
      'germinationPeriod': instance.germinationPeriod,
      'bloomTime': instance.bloomTime,
      'sunExposure': instance.sunExposure,
      'daysToHarvest': instance.daysToHarvest,
      'varieties': instance.varieties,
      'pests': instance.pests,
      'diseases': instance.diseases,
      'learnMore': instance.learnMore,
      'photoUrl': instance.photoUrl,
    };
