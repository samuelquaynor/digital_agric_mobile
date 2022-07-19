part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({required this.forecast, this.weather});

  final Weather? weather;
  final List<Weather?> forecast;

  @override
  List<Object?> get props => [weather, forecast];
}

class WeatherError extends WeatherState {
  const WeatherError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
