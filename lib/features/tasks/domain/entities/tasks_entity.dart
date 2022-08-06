import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/hive_adapters.dart';

part 'tasks_entity.g.dart';
part 'tasks_entity.freezed.dart';

@HiveType(typeId: HiveAdapters.tasks)
@freezed
class TasksEntity with _$TasksEntity {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory TasksEntity({
    @HiveField(0) String? id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required String startTime,
    @HiveField(4) required String endTime,
    @HiveField(6) required List<dynamic> farms,
    @HiveField(7) required String status,
  }) = _TasksEntity;

  /// Initial state with default values
  factory TasksEntity.initial() => const TasksEntity(
      name: '',
      description: '',
      startTime: '',
      endTime: '',
      farms: <String>[],
      status: 'To-do');

  /// Convert from json to model
  factory TasksEntity.fromJson(Map<String, dynamic> json) =>
      _$TasksEntityFromJson(json);
}
