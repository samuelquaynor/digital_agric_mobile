import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/tasks_entity.dart';

/// Task Repository
abstract class TasksRepository {
  /// Create a new task
  Future<Either<Failure, String?>> createTask(TasksEntity task);

  /// Queries Tasks from firestore
  Future<Either<Failure, List<TasksEntity?>>> getTasks();

  /// Delete Tasks from firestore
  Future<Either<Failure, bool>> deleteTask(TasksEntity task);

  /// Marks tasks as done
  Future<Either<Failure, bool>> markDone(TasksEntity task);

  /// Create task reminder
  Future<Either<Failure, bool>> createTaskReminderNotification(
      TasksEntity task);

  /// Create task reminder
  Future<Either<Failure, bool>> cancelTaskReminderNotification(
      TasksEntity task);
}
