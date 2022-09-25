import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/farm_entity.dart';
import '../repositories/farm_repository.dart';

/// Create farm usecase
class CreateFarm implements UseCase<String?, CreateFarmParams> {
  /// Constructor
  CreateFarm(this.repository);

  /// Farm repository
  final FarmRepository repository;

  @override
  Future<Either<Failure, String?>> call(CreateFarmParams params) =>
      repository.createFarm(farm: params.farm);
}

/// Create farm params
class CreateFarmParams extends Equatable {
  /// Constructor
  const CreateFarmParams(this.farm);

  /// farm paramete
  final FarmEntity farm;

  @override
  List<Object> get props => [farm];
}
