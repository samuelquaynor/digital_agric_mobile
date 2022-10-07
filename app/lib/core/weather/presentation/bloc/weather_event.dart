part of 'weather_bloc.dart';

/// Weather Event
abstract class WeatherEvent extends Equatable {
  /// Constructor
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

/// Loading Weather Event
class LoadWeather extends WeatherEvent {
  /// Constructor
  const LoadWeather();

  @override
  List<Object> get props => [];
}

/// Loading Custom Weather Event
class LoadCustomWeather extends WeatherEvent {
  /// Constructor
  const LoadCustomWeather(this.city);

  /// city weather params
  final String city;

  @override
  List<Object> get props => [city];
}

/// LoadCustomWeatherLocation event
class LoadCustomWeatherLocation extends WeatherEvent {
  /// Constructor
  const LoadCustomWeatherLocation(
      {required this.latitude, required this.longitude});

  /// Latitude params
  final double latitude;

  /// Longitude params
  final double longitude;

  @override
  List<Object> get props => [latitude, longitude];
}
