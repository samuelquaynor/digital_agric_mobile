part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class LoadWeather extends WeatherEvent {
  const LoadWeather();

  @override
  List<Object> get props => [];
}

class LoadCustomWeather extends WeatherEvent {
  const LoadCustomWeather(this.city);

  final String city;

  @override
  List<Object> get props => [city];
}
