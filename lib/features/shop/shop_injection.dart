import 'package:get_it/get_it.dart';

import 'data/datasources/shop_local_database.dart';
import 'data/repositories/shop_repository_impl.dart';
import 'domain/repositories/shop_repository.dart';
import 'domain/usecases/create_order.dart';
import 'domain/usecases/get_categories.dart';
import 'domain/usecases/retrieve_carts.dart';
import 'domain/usecases/save_carts.dart';
import 'presentation/bloc/shop_bloc.dart';

///
void initShop() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => ShopBloc(
        getCategories: sl(),
        retrieveCarts: sl(),
        saveCarts: sl(),
        createTaskUsc: sl(),
        retrieveUser: sl()))
    ..registerLazySingleton(() => GetCategories(sl()))
    ..registerLazySingleton(() => SaveCarts(sl()))
    ..registerLazySingleton(() => CreateOrderkUsc(sl()))
    ..registerLazySingleton(() => RetrieveCarts(sl()))
    ..registerLazySingleton<ShopLocalDatabase>(
        () => ShopLocalDatabaseImpl(sl()))
    ..registerLazySingleton<ShopRepository>(
        () => ShopRepositoryImpl(localDatabase: sl(), networkInfo: sl()));
}
