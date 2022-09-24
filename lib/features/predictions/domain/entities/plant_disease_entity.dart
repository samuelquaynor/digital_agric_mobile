import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_disease_entity.freezed.dart';
part 'plant_disease_entity.g.dart';

/// PlantDiseaseEntity
@freezed
class PlantDiseaseEntity with _$PlantDiseaseEntity {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory PlantDiseaseEntity(
      {required String disease,
      required String plant,
      required String remedy}) = _PlantDiseaseEntity;

  /// Initial state with default values
  factory PlantDiseaseEntity.initial() =>
      const PlantDiseaseEntity(disease: '', plant: '', remedy: '');

  /// Convert from json to model
  factory PlantDiseaseEntity.fromJson(Map<String, dynamic> json) =>
      _$PlantDiseaseEntityFromJson(json);
}
