import 'package:get_it/get_it.dart';

import 'data/repositories/tasks_repository_impl.dart';
import 'domain/repositories/tasks_repository.dart';
import 'domain/usecases/create_task_usc.dart';
import 'domain/usecases/delete_task.dart';
import 'domain/usecases/get_tasks.dart';
import 'domain/usecases/mark_done.dart';
import 'presentation/bloc/tasks_bloc.dart';

///
void initTasks() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => TasksBloc(
        createTaskUsc: sl(),
        getTasks: sl(),
        retrieveUser: sl(),
        deleteTaskUsc: sl(),
        markDoneUsc: sl()))
    ..registerLazySingleton(() => CreateTaskUsc(sl()))
    ..registerLazySingleton(() => MarkDone(sl()))
    ..registerLazySingleton(() => DeleteTask(sl()))
    ..registerLazySingleton(() => GetTasks(sl()))
    // ..registerLazySingleton<FarmLocalDatabase>(
    //     () => FarmLocalDatabaseImpl(sl()))
    ..registerLazySingleton<TasksRepository>(() => TasksRepositoryImpl(sl()));
}
