// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

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
    // final CollectionReference users =
    //     FirebaseFirestore.instance.collection('farms');
    try {
      await networkInfo.hasInternet();
      await localDatabase.save(farm);
      // final result = users
      //     .add(farm.toJson())
      //     .then((value) => '')
      //     .catchError((dynamic error) => 'Failed to create farm $error');
      // return Right(await result);
      return right(null);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
