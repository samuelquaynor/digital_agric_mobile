import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/hive_adapters.dart';

part 'crop_info.freezed.dart';
part 'crop_info.g.dart';

/// Crop INformation
@HiveType(typeId: HiveAdapters.cropInfo)
@freezed
class CropInfo with _$CropInfo {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory CropInfo(
      {@HiveField(0) required int id,
      @HiveField(1) String? description,
      @HiveField(2) String? name,
      @HiveField(3) String? plantType,
      @HiveField(4) String? flowerColor,
      @HiveField(5) String? soilPH,
      @HiveField(6) String? soilTemperature,
      @HiveField(7) String? germinationPeriod,
      @HiveField(8) String? bloomTime,
      @HiveField(9) String? sunExposure,
      @HiveField(10) int? daysToHarvest,
      @HiveField(11) List<String?>? varieties,
      @HiveField(12) List<String?>? pests,
      @HiveField(13) List<String?>? diseases,
      @HiveField(14) String? learnMore,
      @HiveField(15) String? photoUrl}) = _CropInfo;

  /// Initial state with default values
  factory CropInfo.initial() => const CropInfo(
      id: 0,
      bloomTime: '',
      description: '',
      diseases: [],
      flowerColor: '',
      germinationPeriod: '',
      learnMore: '',
      name: '',
      pests: [],
      photoUrl: '',
      plantType: '',
      soilPH: '',
      soilTemperature: '',
      sunExposure: '',
      daysToHarvest: 0,
      varieties: []);

  /// Convert from json to model
  factory CropInfo.fromJson(Map<String, dynamic> json) =>
      _$CropInfoFromJson(json);
}
