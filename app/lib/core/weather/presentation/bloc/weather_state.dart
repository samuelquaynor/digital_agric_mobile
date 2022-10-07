part of 'weather_bloc.dart';

/// Weather bloc state
abstract class WeatherState extends Equatable {
  /// Constructor
  const WeatherState();

  @override
  List<Object?> get props => [];
}

/// Weather bloc state loading
class WeatherLoading extends WeatherState {}

/// Weather bloc loaded
class WeatherLoaded extends WeatherState {
  /// Constructor
  const WeatherLoaded({required this.forecast, this.weather});

  /// Weather data
  final Weather? weather;

  /// Weather forecast data
  final List<Weather?> forecast;

  @override
  List<Object?> get props => [weather, forecast];
}

/// Weather bloc state error
class WeatherError extends WeatherState {
  /// Constructor
  const WeatherError(this.message);

  /// error message
  final String message;

  @override
  List<Object> get props => [message];
}
