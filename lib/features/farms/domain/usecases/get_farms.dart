import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/farm_entity.dart';
import '../repositories/farm_repository.dart';

/// Queries List of Farms
class GetFarm implements UseCase<List<FarmEntity?>, NoParams> {
  /// Constructor
  GetFarm(this.repository);

  /// Farm Repository
  final FarmRepository repository;

  @override
  Future<Either<Failure, List<FarmEntity?>>> call(NoParams params) =>
      repository.getFarms();
}
