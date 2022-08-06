import 'package:equatable/equatable.dart';

import '../../domain/entities/tasks_entity.dart';
import '../../domain/usecases/create_task_usc.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc {
  TasksBloc(this.createTaskUsc);

  final CreateTaskUsc createTaskUsc;

  /// Create a task
  Future<String?> createTaskBloc(TasksEntity task) async {
    final result = await createTaskUsc(CreateTaskUscParams(task));
    return result.fold((l) => l.toString(), (r) => null);
  }
}
