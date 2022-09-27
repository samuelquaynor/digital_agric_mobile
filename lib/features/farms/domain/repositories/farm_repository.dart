import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/crop_info.dart';
import '../entities/farm_entity.dart';

/// Farm Repository
abstract class FarmRepository {
  /// Create a farm on firebase
  Future<Either<Failure, String?>> createFarm({required FarmEntity farm});

  /// Queries farms from firestore
  Future<Either<Failure, List<FarmEntity?>>> getFarms();

  /// Get Crop info from firebase realtime database
  Future<Either<Failure, List<CropInfo>>> getCropInfos();
  
  /// Create a farm on firebase
  Future<Either<Failure, bool>> updateFarm({required FarmEntity farm});

  /// Create a farm on firebase
  Future<Either<Failure, bool>> deleteFarm({required FarmEntity farm});
}
