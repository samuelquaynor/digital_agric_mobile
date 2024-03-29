import 'package:get_it/get_it.dart';

import 'data/datasources/farm_local_database.dart';
import 'data/repositories/farm_repository_impl.dart';
import 'domain/repositories/farm_repository.dart';
import 'domain/usecases/create_farm.dart';
import 'domain/usecases/delete_farm.dart';
import 'domain/usecases/edit_farm.dart';
import 'domain/usecases/get_crop_info.dart';
import 'domain/usecases/get_farms.dart';
import 'presentation/bloc/farms_bloc.dart';

/// Farm injection
void initFarm() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => FarmsBloc(
        createFarm: sl(),
        getFarm: sl(),
        retrieveUser: sl(),
        getCropInfo: sl(),
        deleteTaskUsc: sl(),
        downLoadImageUrl: sl(),
        openImageGallery: sl(),
        uploadFirebaseImage: sl(),
        deleteFarm: sl(),
        editFarm: sl()))
    ..registerLazySingleton(() => CreateFarm(sl()))
    ..registerLazySingleton(() => GetFarm(sl()))
    ..registerLazySingleton(() => DeleteFarm(sl()))
    ..registerLazySingleton(() => EditFarm(sl()))
    ..registerLazySingleton(() => GetCropInfo(sl()))
    ..registerLazySingleton<FarmLocalDatabase>(
        () => FarmLocalDatabaseImpl(sl()))
    ..registerLazySingleton<FarmRepository>(
        () => FarmRepositoryImpl(localDatabase: sl(), networkInfo: sl()));
}
