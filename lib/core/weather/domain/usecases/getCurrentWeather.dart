import 'package:dartz/dartz.dart';
import 'package:weather/weather.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/weather_repository.dart';

/// Get Current Weather Usercase
class GetCurrentWeather implements UseCase<Weather, NoParams> {
  /// Constructor
  GetCurrentWeather(this.repository);

  /// Weather respository
  final WeatherRepository repository;

  @override
  Future<Either<Failure, Weather>> call(NoParams params) =>
      repository.getCurrentWeather();
}
