import 'package:dartz/dartz.dart';
import 'package:weather/weather.dart';

import '../../../../core/error/failures.dart';

/// Weather Repository
abstract class WeatherRepository {
  /// Get Current Weather
  Future<Either<Failure, Weather>> getCurrentWeather();

  /// Get Current Weather By City
  Future<Either<Failure, Weather>> getCurrentWeatherByCity(String city);

  /// Get Forecast Weather
  Future<Either<Failure, List<Weather>>> getForeCastWeather();

  /// Get Forecast Weather By City
  Future<Either<Failure, List<Weather>>> getForeCastWeatherByCity(String city);
}
