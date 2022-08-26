import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../features/farms/domain/entities/farm_entity.dart';
import '../../../../features/tasks/domain/entities/tasks_entity.dart';
import '../../../data/hive_adapters.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User entity
/// flutter packages run build_runner build --delete-conflicting-outputs
@HiveType(typeId: HiveAdapters.user)
@freezed
class UserEntity with _$UserEntity {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory UserEntity({
    /// primary key
    @HiveField(0) required String id,
    /// Email Address
    @HiveField(1) required String email,
    /// Full Name
    @HiveField(2) required String name,
    /// Farms
    @HiveField(5) required List<FarmEntity> farms,
    /// Tasks
    @HiveField(6) required List<TasksEntity> tasks,
  }) = _UserEntity;

  /// Initial state with default values
  factory UserEntity.initial() => const UserEntity(
        id: '',
        email: '',
        name: '',
        farms: [],
        tasks: []
      );

  /// Convert from json to model
  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
