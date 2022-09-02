import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tasks_entity.dart';
import '../repositories/tasks_repository.dart';

/// Mark Task as done usecase
class MarkDone implements UseCase<bool, MarkDoneParams> {
  /// Constructor
  MarkDone(this.repository);

  /// Tasks Repository
  final TasksRepository repository;

  @override
  Future<Either<Failure, bool>> call(MarkDoneParams params) =>
      repository.markDone(params.task);
}

/// Mark Task as done usecase params
class MarkDoneParams extends Equatable {
  /// Constructor
  const MarkDoneParams(this.task);

  /// Task Entity
  final TasksEntity task;

  @override
  List<Object> get props => [task];
}
