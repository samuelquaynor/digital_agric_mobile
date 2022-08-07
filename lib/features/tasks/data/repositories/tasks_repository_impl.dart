import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/tasks_entity.dart';
import '../../domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  /// Constructor
  TasksRepositoryImpl(this.networkInfo);

  /// Network information
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String?>> createTasks(TasksEntity task) async {
    final currentFirebaseUser =
        //await
        FirebaseAuth.instance.currentUser!;
    final userid = currentFirebaseUser.uid;
    final users = FirebaseFirestore.instance.collection('users/$userid/tasks');
    try {
      await networkInfo.hasInternet();
      final result = users
          .add(<String, dynamic>{
            'name': task.name,
            'description': task.description,
            'startTime': task.startTime,
            'endTime': task.endTime,
            'status': task.status,
            'farms': task.farms
          })
          .then((value) => '')
          .catchError((dynamic error) => 'Failed to create task $error');
      return right(null);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<TasksEntity?>>> getTasks() async {
    final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
    final userid = currentFirebaseUser.uid;
    final tasks = <TasksEntity>[];
    final tasksFire = FirebaseFirestore.instance.collection('users');
    try {
      await networkInfo.hasInternet();
      final result = await tasksFire.doc(userid).collection('tasks').get();
      for (final task in result.docs) {
        tasks.add(TasksEntity(
            id: task.id,
            name: task.get('name') as String,
            startTime: task.get('startTime') as String,
            endTime: task.get('endTime') as String,
            description: task.get('description') as String,
            status: task.get('status') as String,
            farms: task.get('farms') as List<dynamic>));
      }
      return Right(tasks);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
