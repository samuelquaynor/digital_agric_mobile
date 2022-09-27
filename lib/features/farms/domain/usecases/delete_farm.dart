import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/farm_entity.dart';
import '../repositories/farm_repository.dart';

/// Edit Farm usecase
class DeleteFarm implements UseCase<bool, DeleteFarmParams> {
  /// Constructor
  DeleteFarm(this.repository);

  /// Farm Repository
  final FarmRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeleteFarmParams params) =>
      repository.deleteFarm(farm: params.farm);
}

/// Edit Farm Params
class DeleteFarmParams extends Equatable {
  /// Constructor
  const DeleteFarmParams(this.farm);

  /// Farm Entity
  final FarmEntity farm;

  @override
  List<Object> get props => [farm];
}
