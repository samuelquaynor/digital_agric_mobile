import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/tasks_entity.dart';
import '../../domain/usecases/create_task_usc.dart';
import '../../domain/usecases/get_tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc {
  TasksBloc({required this.createTaskUsc, required this.getTasks});

  final CreateTaskUsc createTaskUsc;

  final GetTasks getTasks;

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
}
