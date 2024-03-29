import 'package:get_it/get_it.dart';

import 'data/datasources/prediction_remote_database.dart';
import 'data/repositories/prediction_repository_impl.dart';
import 'domain/repositories/prediction_repository.dart';
import 'domain/usecases/plant_disease_usc.dart';
import 'presentation/bloc/predictions_bloc.dart';

/// init prediction injection
void initPrediction() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => PredictionsBloc(sl()))
    ..registerLazySingleton(() => PlantDiseasePredictor(sl()))
    ..registerLazySingleton<PredictionRemoteDatabase>(
        PredictionRemoteDatabaseImpl.new)
    ..registerLazySingleton<PredictionRepository>(() =>
        PredictionRepositoryImpl(
            predictionRemoteDatabase: sl(), networkInfo: sl()));
}
