import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/plant_disease_entity.dart';
import '../../domain/repositories/prediction_repository.dart';
import '../datasources/prediction_remote_database.dart';

//// Implement [PredictionRepository] Repository
class PredictionRepositoryImpl implements PredictionRepository {
  /// Constructor
  PredictionRepositoryImpl(
      {required this.networkInfo, required this.predictionRemoteDatabase});

  /// Network information
  final NetworkInfo networkInfo;

  /// Prediction remote database
  final PredictionRemoteDatabase predictionRemoteDatabase;

  @override
  Future<Either<Failure, PlantDiseaseEntity>> plantDiseasePredictorRepo(
      String imagePath) async {
    try {
      await networkInfo.hasInternet();
      final result =
          await predictionRemoteDatabase.plantDiseasePredictor(imagePath);
      return Right(result);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
