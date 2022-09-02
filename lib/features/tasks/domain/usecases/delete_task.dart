import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tasks_entity.dart';
import '../repositories/tasks_repository.dart';

/// Delete Tasks entity
class DeleteTask implements UseCase<bool, DeleteTaskParams> {
  /// Constructor
  DeleteTask(this.repository);

  /// Tasks Repository
  final TasksRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeleteTaskParams params) =>
      repository.deleteTasks(params.task);
}

/// Delete Tasks entity params
class DeleteTaskParams extends Equatable {
  /// Constructor
  const DeleteTaskParams(this.task);

  /// Task Entity
  final TasksEntity task;

  @override
  List<Object> get props => [task];
}
