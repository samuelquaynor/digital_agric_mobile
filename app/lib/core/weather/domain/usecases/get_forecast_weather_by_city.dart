import 'package:dartz/dartz.dart';
import 'package:weather/weather.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/weather_repository.dart';

/// Get Forecast Weather By City Usercase
class GetForecastWeatherByCity implements UseCase<List<Weather>, StringParams> {
  /// Constructor
  GetForecastWeatherByCity(this.repository);

  /// Weather respository
  final WeatherRepository repository;

  @override
  Future<Either<Failure, List<Weather>>> call(StringParams params) =>
      repository.getForeCastWeatherByCity(params.value);
}
