import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tasks_entity.dart';
import '../repositories/tasks_repository.dart';

/// Create task usecase
class CreateTaskUsc implements UseCase<String?, CreateTaskUscParams> {
  /// Constructor
  CreateTaskUsc(this.repository);

  /// Tasks Repository
  final TasksRepository repository;

  @override
  Future<Either<Failure, String?>> call(CreateTaskUscParams params) =>
      repository.createTask(params.task);
}

/// Create task usecase params
class CreateTaskUscParams extends Equatable {
  /// Constructor
  const CreateTaskUscParams(this.task);

  /// Task entity
  final TasksEntity task;

  @override
  List<Object> get props => [task];
}
