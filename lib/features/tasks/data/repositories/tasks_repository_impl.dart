import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../../farms/domain/entities/farm_entity.dart';
import '../../domain/entities/tasks_entity.dart';
import '../../domain/repositories/tasks_repository.dart';

/// Implement [TasksRepository]
class TasksRepositoryImpl implements TasksRepository {
  /// Constructor
  TasksRepositoryImpl(this.networkInfo);

  /// Network information
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String?>> createTasks(TasksEntity task) async {
    final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
    final userid = currentFirebaseUser.uid;
    try {
      await networkInfo.hasInternet();
      final users =
          FirebaseFirestore.instance.collection('users/$userid/tasks');
      await users
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
    try {
      await networkInfo.hasInternet();
      final tasksFire = FirebaseFirestore.instance.collection('users');
      final result = await tasksFire
          .doc(userid)
          .collection('tasks')
          .orderBy('endTime')
          .get();
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

  @override
  Future<Either<Failure, bool>> deleteTasks(TasksEntity task) async {
    try {
      await networkInfo.hasInternet();
      final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
      final userid = currentFirebaseUser.uid;
      final tasksFire = FirebaseFirestore.instance.collection('users');
      await tasksFire
          .doc(userid)
          .collection('tasks')
          .doc(task.id)
          .delete()
          .catchError((dynamic error) =>
              throw DeviceException('{deleting task had an error $error}'));
      return const Right(true);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, bool>> markDone(TasksEntity task) async {
    try {
      await networkInfo.hasInternet();
      final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
      final userid = currentFirebaseUser.uid;
      final tasksFire = FirebaseFirestore.instance.collection('users');
      await tasksFire
          .doc(userid)
          .collection('tasks')
          .doc(task.id)
          .update(task.toJson())
          .catchError((dynamic error) =>
              throw DeviceException('{updating task had an error $error}'));
      return const Right(true);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
