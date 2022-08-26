import 'package:get_it/get_it.dart';

import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user.dart';
import 'domain/usecases/login.dart';
import 'domain/usecases/logout.dart';
import 'domain/usecases/retrieveUser.dart';
import 'domain/usecases/sign_up.dart';

/// Add user dependency
void initUser() {
  final sl = GetIt.instance;
  sl
    //usecases
    ..registerLazySingleton(() => Login(sl()))
    ..registerLazySingleton(() => Logout(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => GetUser(sl()))
    ..registerLazySingleton(() => RetrieveUser(sl()))
    // Repository
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  // database
  // ..registerLazySingleton<UserLocalDatabase>(
  //     () => UserLocalDatabaseImpl(sl()))
  // ..registerLazySingleton<UserRemoteDatabase>(
  //     () => UserRemoteDatabaseImpl(sl()));
}
