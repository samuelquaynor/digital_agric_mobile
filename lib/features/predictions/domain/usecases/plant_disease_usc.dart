import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/plant_disease_entity.dart';
import '../repositories/prediction_repository.dart';

/// plant disease predictor usecase
class PlantDiseasePredictor
    implements UseCase<PlantDiseaseEntity, StringParams> {
  /// Constructor
  PlantDiseasePredictor(this.predictionRepository);

  /// prediction repository
  final PredictionRepository predictionRepository;

  @override
  Future<Either<Failure, PlantDiseaseEntity>> call(StringParams params) =>
      predictionRepository.plantDiseasePredictorRepo(params.value);
}
