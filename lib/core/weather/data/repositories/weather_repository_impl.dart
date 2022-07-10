import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/weather_repository.dart';

/// Weather Repository Implementation
class WeatherRepositoryImpl implements WeatherRepository {
  /// Constructor
  WeatherRepositoryImpl(this.networkInfo);

  ///Weather package key
  WeatherFactory wf = WeatherFactory('dc543b10740f46613f9426802f58f795');

  /// Network information
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Weather>> getCurrentWeather() async {
    await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      final w = await wf.currentWeatherByLocation(
          position.latitude, position.longitude);
      return Right(w);
    } on PlatformException {
      return const Left(Failure('Weather Retrieval Failed.'));
    }
  }

  @override
  Future<Either<Failure, Weather>> getCurrentWeatherByCity(String city) async {
    try {
      final w = await wf.currentWeatherByCityName(city);
      return Right(w);
    } on PlatformException {
      return const Left(Failure('Weather Retrieval Failed.'));
    }
  }

  @override
  Future<Either<Failure, List<Weather>>> getForeCastWeather() async {
    await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      final forecast = await wf.fiveDayForecastByLocation(
          position.latitude, position.longitude);
      return Right(forecast);
    } on PlatformException {
      return const Left(Failure('Weather Retrieval Failed.'));
    }
  }

  @override
  Future<Either<Failure, List<Weather>>> getForeCastWeatherByCity(String city) async {
    try {
      final forecast = await wf.fiveDayForecastByCityName(city);
      return Right(forecast);
    } on PlatformException {
      return const Left(Failure('Weather Retrieval Failed.'));
    }
  }
}
