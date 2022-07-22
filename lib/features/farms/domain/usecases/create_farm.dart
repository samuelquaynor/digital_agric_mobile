import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/farm_entity.dart';
import '../repositories/Farm_repository.dart';

class CreateFarm implements UseCase<String?, CreateFarmParams> {
  /// Constructor
  CreateFarm(this.repository);

  final FarmRepository repository;

  @override
  Future<Either<Failure, String?>> call(CreateFarmParams params) =>
      repository.createFarm(farm: params.farm);
}

class CreateFarmParams extends Equatable {
  /// Constructor
  const CreateFarmParams(this.farm);

  final FarmEntity farm;

  @override
  List<Object> get props => [farm];
}
