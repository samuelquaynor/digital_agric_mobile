import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/weather_repository.dart';

/// Get Current Weather By Location Usercase
class GetForecastWeatherByLocation
    implements UseCase<List<Weather>, GFWBLParams> {
  /// Constructor
  GetForecastWeatherByLocation(this.repository);

  /// Weather respository
  final WeatherRepository repository;

  @override
  Future<Either<Failure, List<Weather>>> call(GFWBLParams params) =>
      repository.getForeCastWeatherByLongitudeLatitude(
          latitude: params.latitude, longitude: params.longitude);
}

/// GetCurrentWeatherByLocation params
class GFWBLParams extends Equatable {
  /// Constructor
  const GFWBLParams({required this.latitude, required this.longitude});

  /// Latitude params
  final double latitude;

  /// Longitude params
  final double longitude;

  @override
  List<Object> get props => [latitude, longitude];
}
