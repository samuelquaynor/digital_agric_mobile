import 'package:get_it/get_it.dart';

import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_current_weather.dart';
import 'domain/usecases/get_current_weather_by_city.dart';
import 'domain/usecases/get_current_weather_by_location.dart';
import 'domain/usecases/get_forecast_weather_by_city.dart';
import 'domain/usecases/get_forecast_weather_by_location.dart';
import 'domain/usecases/get_weather_forecast.dart';
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
