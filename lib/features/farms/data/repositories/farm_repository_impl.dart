// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/farm_entity.dart';
import '../../domain/repositories/farm_repository.dart';
import '../datasources/farm_local_database.dart';

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
    final currentFirebaseUser =
        //await
        FirebaseAuth.instance.currentUser!;
    final userid = currentFirebaseUser.uid;
    final users = FirebaseFirestore.instance.collection('users/$userid/farms');
    try {
      await networkInfo.hasInternet();
      await localDatabase.save(farm);
      final result = users
          .add(<String, dynamic>{
            'name': farm.name,
            'farmSize': farm.farmSize,
            'longitude': farm.longitude,
            'latitude': farm.latitude,
            'soilType': farm.soilType,
            'crops': farm.crops,
          })
          .then((value) => '')
          .catchError((dynamic error) => 'Failed to create farm $error');
      return right(null);
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
            farmSize: farm.get('farmSize') as double,
            longitude: farm.get('longitude') as double,
            latitude: farm.get('latitude') as double,
            crops: farm.get('crops') as List<dynamic>));
      }
      return Right(farms);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
