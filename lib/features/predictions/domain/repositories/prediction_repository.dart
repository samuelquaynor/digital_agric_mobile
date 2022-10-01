import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/crop_info.dart';
import '../entities/plant_disease_entity.dart';

//// Prediction Repository
abstract class PredictionRepository {
  /// repository for plant disease predictor
  Future<Either<Failure, PlantDiseaseEntity>> plantDiseasePredictorRepo(
      String imagePath);

  /// Get Crop info from firebase realtime database
  Future<Either<Failure, List<CropInfo>>> getCropInfos();
}
