// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive/hive.dart';

// import '../../../../core/data/hive_adapters.dart';

// part 'farmer_crop.freezed.dart';
// part 'farmer_crop.g.dart';

// /// Farmer Crop
// @HiveType(typeId: HiveAdapters.farmerCrop)
// @freezed
// class FarmerCrop with _$FarmerCrop {
//   /// Constructor
//   @JsonSerializable(explicitToJson: true)
//   const factory FarmerCrop({@HiveField(0) required String id}) = _FarmerCrop;

//   /// Initial state with default values
//   factory FarmerCrop.initial() => const FarmerCrop(id: '');

//   /// Convert from json to model
//   factory FarmerCrop.fromJson(Map<String, dynamic> json) =>
//       _$FarmerCropFromJson(json);
// }
