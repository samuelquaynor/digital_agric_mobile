import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/hive_adapters.dart';

part 'farm_entity.freezed.dart';
part 'farm_entity.g.dart';

/// Farm entity
@HiveType(typeId: HiveAdapters.farm)
@freezed
class FarmEntity with _$FarmEntity {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory FarmEntity({
    @HiveField(0) required String id,
  }) = _FarmEntity;

  /// Initial state with default values
  factory FarmEntity.initial() => const FarmEntity(id: '');

  /// Convert from json to model
  factory FarmEntity.fromJson(Map<String, dynamic> json) =>
      _$FarmEntityFromJson(json);
}
