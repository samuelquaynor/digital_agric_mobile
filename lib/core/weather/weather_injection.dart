import 'package:get_it/get_it.dart';

import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/getCurrentWeather.dart';
import 'domain/usecases/getCurrentWeatherByCity.dart';
import 'domain/usecases/getCurrentWeatherByLocation.dart';
import 'domain/usecases/getForecastWeather.dart';
import 'domain/usecases/getForecastWeatherByCity.dart';
import 'domain/usecases/getForecastWeatherByLocation.dart';
import 'presentation/bloc/weather_bloc.dart';

/// init weather injection
void initWeather() {
  final sl = GetIt.instance;
// bloc
  sl
    ..registerFactory(() => WeatherBloc(
          getCurrentWeather: sl(),
          getCurrentWeatherByCity: sl(),
          getForecastWeather: sl(),
          getForecastWeatherByCity: sl(),
          getCurrentWeatherByLocation: sl(),
          getForecastWeatherByLocation: sl(),
        ))

    ///usecase
    ..registerLazySingleton(() => GetCurrentWeather(sl()))
    ..registerLazySingleton(() => GetCurrentWeatherByCity(sl()))
    ..registerLazySingleton(() => GetForecastWeather(sl()))
    ..registerLazySingleton(() => GetForecastWeatherByCity(sl()))
    ..registerLazySingleton(() => GetCurrentWeatherByLocation(sl()))
    ..registerLazySingleton(() => GetForecastWeatherByLocation(sl()))

    /// Repository
    ..registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(sl()));
}
