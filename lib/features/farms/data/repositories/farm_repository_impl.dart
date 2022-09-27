// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/crop_info.dart';
import '../../domain/entities/farm_entity.dart';
import '../../domain/repositories/farm_repository.dart';
import '../datasources/farm_local_database.dart';

/// Implementation of [FarmRepository]
class FarmRepositoryImpl implements FarmRepository {
  /// Constructor
  FarmRepositoryImpl({required this.localDatabase, required this.networkInfo});

  /// Local database
  final FarmLocalDatabase localDatabase;

  /// Network information
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String?>> createFarm(
      {required FarmEntity farm}) async {
    final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
    final userid = currentFirebaseUser.uid;
    final farms = FirebaseFirestore.instance.collection('users/$userid/farms');
    try {
      await networkInfo.hasInternet();
      await localDatabase.save(farm);
      await farms
          .add(<String, dynamic>{
            'name': farm.name,
            'farmSize': farm.farmSize,
            'longitude': farm.longitude,
            'latitude': farm.latitude,
            'soilType': farm.soilType,
            'avatar': farm.avatar,
            'crops': farm.crops.map((crop) => {'id': crop?.id}).toList(),
          })
          .then((value) => '')
          .catchError((dynamic error) => 'Failed to create farm $error');
      return right(null);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<CropInfo>>> getCropInfos() async {
    try {
      await networkInfo.hasInternet();
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('cropInfo').get();
      final result = json.encode(snapshot.value);
      final jsonParse = json.decode(result) as List<dynamic>;
      final jsonE = jsonParse
          .cast<Map<String, dynamic>>()
          .map<CropInfo>(CropInfo.fromJson)
          .toList();
      return Right(jsonE);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, List<FarmEntity?>>> getFarms() async {
    final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
    final userid = currentFirebaseUser.uid;
    final farms = <FarmEntity>[];
    final farmsFire = FirebaseFirestore.instance.collection('users');
    try {
      await networkInfo.hasInternet();
      final result = await farmsFire.doc(userid).collection('farms').get();
      for (final farm in result.docs) {
        farms.add(FarmEntity(
            id: farm.id,
            name: farm.get('name') as String,
            soilType: farm.get('soilType') as String,
            avatar: farm.get('avatar') as String?,
            farmSize: farm.get('farmSize') as double,
            longitude: farm.get('longitude') as double,
            latitude: farm.get('latitude') as double,
            crops: farm.get('crops') as List<CropInfo?>));
      }
      return Right(farms);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFarm({required FarmEntity farm}) async {
    try {
      await networkInfo.hasInternet();
      final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
      final userid = currentFirebaseUser.uid;
      final tasksFire = FirebaseFirestore.instance.collection('users');
      await tasksFire
          .doc(userid)
          .collection('farms')
          .doc(farm.id)
          .delete()
          .catchError((dynamic error) =>
              throw DeviceException('{deleting task had an error $error}'));
      return const Right(true);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, bool>> updateFarm({required FarmEntity farm}) async {
    try {
      await networkInfo.hasInternet();
      final currentFirebaseUser = FirebaseAuth.instance.currentUser!;
      final userid = currentFirebaseUser.uid;
      final tasksFire = FirebaseFirestore.instance.collection('users');
      await tasksFire
          .doc(userid)
          .collection('farms')
          .doc(farm.id)
          .update(<String, dynamic>{
        'name': farm.name,
        'farmSize': farm.farmSize,
        'longitude': farm.longitude,
        'latitude': farm.latitude,
        'soilType': farm.soilType,
        'avatar': farm.avatar,
        'crops': farm.crops.map((crop) => {'id': crop?.id}).toList(),
      });
      return const Right(true);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
