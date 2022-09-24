import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/plant_disease_entity.dart';

//// Prediction Repository
abstract class PredictionRepository {
  /// repository for plant disease predictor
  Future<Either<Failure, PlantDiseaseEntity>> plantDiseasePredictorRepo(
      String imagePath);
}
