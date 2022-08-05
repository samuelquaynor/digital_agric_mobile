import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/farm_entity.dart';

abstract class FarmRepository {
  Future<Either<Failure, String?>> createFarm({required FarmEntity farm});

  
  Future<Either<Failure, FarmEntity>> getFarms();
}
