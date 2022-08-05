// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

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
    final uid = const Uuid().v1();
    final currentFirebaseUser =
        //await
        FirebaseAuth.instance.currentUser!;
    final userid = currentFirebaseUser.uid;
    print(userid);
    final users = FirebaseDatabase.instance.ref('farms/$userid');
    try {
      await networkInfo.hasInternet();
      await localDatabase.save(farm);
      final result = users
          .set(farm.copyWith(id: uid).toJson())
          .then((value) => '')
          .catchError((dynamic error) => 'Failed to create farm $error');
      print(await result);
      // return Right(await result);
      return right(null);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, FarmEntity>> getFarms() {
    // TODO: implement getFarms
    throw UnimplementedError();
  }
}
