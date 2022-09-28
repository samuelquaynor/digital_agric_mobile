import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/weather_repository.dart';

/// Get Current Weather By Location Usercase
class GetCurrentWeatherByLocation implements UseCase<Weather, GCWBLParams> {
  /// Constructor
  GetCurrentWeatherByLocation(this.repository);

  /// Weather respository
  final WeatherRepository repository;

  @override
  Future<Either<Failure, Weather>> call(GCWBLParams params) =>
      repository.getCurrentWeatherByLongitudeLatitude(
          latitude: params.latitude, longitude: params.longitude);
}

/// GetCurrentWeatherByLocation params
class GCWBLParams extends Equatable {
  /// Constructor
  const GCWBLParams({required this.latitude, required this.longitude});

  /// Latitude
  final double latitude;

  /// Longitude
  final double longitude;

  @override
  List<Object> get props => [latitude, longitude];
}
