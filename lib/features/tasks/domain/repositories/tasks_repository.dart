import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/tasks_entity.dart';

abstract class TasksRepository {
  Future<Either<Failure, String?>> createTasks(TasksEntity task);

  
  Future<Either<Failure, List<TasksEntity?>>> getTasks();
}
