import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/weather_repository.dart';

/// Get Current Weather By City Usercase
class GetCurrentWeatherByCity implements UseCase<Weather, StringParams> {
  /// Constructor
  GetCurrentWeatherByCity(this.repository);

  /// Weather respository
  final WeatherRepository repository;

  @override
  Future<Either<Failure, Weather>> call(StringParams params) =>
      repository.getCurrentWeatherByCity(params.value);
}
