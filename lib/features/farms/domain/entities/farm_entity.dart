import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/hive_adapters.dart';
import 'crop_info.dart';

part 'farm_entity.freezed.dart';
part 'farm_entity.g.dart';

/// Farm entity
@HiveType(typeId: HiveAdapters.farm)
@freezed
class FarmEntity with _$FarmEntity {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory FarmEntity({
    @HiveField(0) String? id,
    @HiveField(1) required String name,
    @HiveField(2) required String soilType,
    @HiveField(3) required double farmSize,
    @HiveField(4) required double longitude,
    @HiveField(5) required double latitude,
    @HiveField(7) String? avatar,
    @JsonKey(
        name: 'crops', defaultValue: <CropInfo>[], fromJson: _cropsFromJson)
    @HiveField(6)
        required List<CropInfo?> crops,
  }) = _FarmEntity;

  /// Initial state with default values
  factory FarmEntity.initial() => const FarmEntity(
      name: '',
      soilType: '',
      farmSize: 0,
      longitude: 0,
      latitude: 0,
      crops: []);

  /// Convert from json to model
  factory FarmEntity.fromJson(Map<String, dynamic> json) =>
      _$FarmEntityFromJson(json);
}

List<CropInfo> _cropsFromJson(List<dynamic> json) {
  return json
      .cast<Map<String, dynamic>>()
      .map<CropInfo>(CropInfo.fromJson)
      .toList();
}
