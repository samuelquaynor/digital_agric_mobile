import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/plant_disease_entity.dart';
import '../repositories/prediction_repository.dart';

/// Send Alert
class SendAlert implements UseCase<bool, SendAlertParams> {
  /// Constructor
  SendAlert(this.repository);

  /// Prediction Repository
  final PredictionRepository repository;

  @override
  Future<Either<Failure, bool>> call(SendAlertParams params) =>
      repository.sendAlerts(params.entity);
}

/// Send alert params
class SendAlertParams extends Equatable {
  /// Constructor
  const SendAlertParams(this.entity);

  /// Plant Disease Entity
  final PlantDiseaseEntity entity;

  @override
  List<Object> get props => [entity];
}
