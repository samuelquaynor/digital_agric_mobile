import 'package:get_it/get_it.dart';

import 'data/repositories/news_repository_impl.dart';
import 'domain/repositories/news_repository.dart';
import 'domain/usecases/get_headlines.dart';
import 'presentation/bloc/news_bloc.dart';

/// News injection
void initNews() {
  final sl = GetIt.instance;
// bloc
  sl
    ..registerFactory(() => NewsBloc(
          sl(),
        ))

    ///usecase
    ..registerLazySingleton(() => GetHeadlines(sl()))

    /// Repository
    ..registerLazySingleton<NewsRepository>(NewsRepositoryImpl.new);
}
