import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/retrieveUser.dart';
import '../../domain/entities/tasks_entity.dart';
import '../../domain/usecases/create_task_usc.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/mark_done.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

/// Tasks Bloc
class TasksBloc {
  /// Constructor
  TasksBloc(
      {required this.retrieveUser,
      required this.createTaskUsc,
      required this.markDoneUsc,
      required this.deleteTaskUsc,
      required this.getTasks});

  /// Mark Tasks as Done Usecase
  final MarkDone markDoneUsc;

  /// Create Tasks Usecase
  final CreateTaskUsc createTaskUsc;

  /// Delete Tasks Usecase
  final DeleteTask deleteTaskUsc;

  /// User Tasks Usecase
  final GetTasks getTasks;

  /// Retrieve User Usecase
  final RetrieveUser retrieveUser;

  /// Create a task
  Future<String?> createTaskBloc(TasksEntity task) async {
    final result = await createTaskUsc(CreateTaskUscParams(task));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Mark Tasks as Done bloc
  Future<String?> markDoneBloc(TasksEntity task) async {
    final result = await markDoneUsc(MarkDoneParams(task));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Delete Tasks bloc
  Future<String?> deleteTaskBloc(TasksEntity task) async {
    final result = await deleteTaskUsc(DeleteTaskParams(task));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Query Tasks
  Future<List<TasksEntity?>> getTasksBloc() async {
    final result = await retrieveUser(const RetrieveUserParams());
    return result.fold((l) => [], (r) => r.tasks);
  }

  /// Get User
  Future<UserEntity> retrieveUserBloc() async {
    final result = await retrieveUser(const RetrieveUserParams());
    return result.fold((l) => UserEntity.initial(), (r) => r);
  }
}
