import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/retrieveUser.dart';
import '../../domain/entities/tasks_entity.dart';
import '../../domain/usecases/create_task_usc.dart';
import '../../domain/usecases/get_tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

/// Tasks Bloc
class TasksBloc {
  /// Constructor
  TasksBloc(
      {required this.retrieveUser,
      required this.createTaskUsc,
      required this.getTasks});

  /// Create Tasks Usecase
  final CreateTaskUsc createTaskUsc;

  /// User Tasks Usecase
  final GetTasks getTasks;

  /// Retrieve User Usecase
  final RetrieveUser retrieveUser;

  /// Create a task
  Future<String?> createTaskBloc(TasksEntity task) async {
    final result = await createTaskUsc(CreateTaskUscParams(task));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Query Tasks
  Future<List<TasksEntity?>> getTaksBloc() async {
    final result = await getTasks(NoParams());
    return result.fold((l) => [], (r) => r);
  }

  /// Get User
  Future<UserEntity> retrieveUserBloc() async {
    final result = await retrieveUser(NoParams());
    return result.fold((l) => UserEntity.initial(), (r) => r);
  }
}
