import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tasks_entity.dart';
import '../repositories/tasks_repository.dart';

/// Queries List of Taks
class GetTasks implements UseCase<List<TasksEntity?>, NoParams> {
  /// Constructor
  GetTasks(this.repository);

  /// Tasks Repository
  final TasksRepository repository;

  @override
  Future<Either<Failure, List<TasksEntity?>>> call(NoParams params) =>
      repository.getTasks();
}
