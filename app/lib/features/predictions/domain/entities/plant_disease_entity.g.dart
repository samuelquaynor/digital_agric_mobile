// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_disease_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlantDiseaseEntity _$$_PlantDiseaseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_PlantDiseaseEntity(
      disease: json['disease'] as String,
      plant: json['plant'] as String,
      remedy: json['remedy'] as String,
    );

Map<String, dynamic> _$$_PlantDiseaseEntityToJson(
        _$_PlantDiseaseEntity instance) =>
    <String, dynamic>{
      'disease': instance.disease,
      'plant': instance.plant,
      'remedy': instance.remedy,
    };
