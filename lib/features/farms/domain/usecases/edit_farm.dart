import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/farm_entity.dart';
import '../repositories/farm_repository.dart';

/// Edit Farm usecase
class EditFarm implements UseCase<bool, EditFarmParams> {
  /// Constructor
  EditFarm(this.repository);

  /// Farm Repository
  final FarmRepository repository;

  @override
  Future<Either<Failure, bool>> call(EditFarmParams params) =>
      repository.updateFarm(farm: params.farm);
}

/// Edit Farm Params
class EditFarmParams extends Equatable {
  /// Constructor
  const EditFarmParams(this.farm);

  /// Farm Entity
  final FarmEntity farm;

  @override
  List<Object> get props => [farm];
}
