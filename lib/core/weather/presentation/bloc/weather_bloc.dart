import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_current_weather.dart';
import '../../domain/usecases/get_current_weather_by_city.dart';
import '../../domain/usecases/get_current_weather_by_location.dart';
import '../../domain/usecases/get_forecast_weather_by_city.dart';
import '../../domain/usecases/get_forecast_weather_by_location.dart';
import '../../domain/usecases/get_weather_forecast.dart';

part 'weather_event.dart';
part 'weather_state.dart';

///Weather Bloc
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  /// Constructor
  WeatherBloc(
      {required this.getCurrentWeatherByCity,
      required this.getForecastWeather,
      required this.getForecastWeatherByCity,
      required this.getCurrentWeather,
      required this.getForecastWeatherByLocation,
      required this.getCurrentWeatherByLocation})
      : super(WeatherLoading()) {
    on<LoadWeather>(getCurrentWeatherBloc);
    on<LoadCustomWeather>(getCurrentWeatherByCityBloc);
    on<LoadCustomWeatherLocation>(getWeatherByLocationBloc);
  }

  /// Get weather usecase
  final GetCurrentWeather getCurrentWeather;

  /// Get weather by city usecase
  final GetCurrentWeatherByCity getCurrentWeatherByCity;

  /// Get weather forecast usecase
  final GetForecastWeather getForecastWeather;

  /// Get weather forecast usecase
  final GetForecastWeatherByCity getForecastWeatherByCity;

  /// Get weather by location forecast usecase
  final GetForecastWeatherByLocation getForecastWeatherByLocation;

  /// Get weather by location usecase
  final GetCurrentWeatherByLocation getCurrentWeatherByLocation;

  /// Get weather bloc
  Future<void> getCurrentWeatherBloc(
      LoadWeather event, Emitter<WeatherState> emit) async {
    final weather = await getCurrentWeather(NoParams());
    final forecast = await getForecastWeather(NoParams());
    late Weather wea;
    emit(weather.fold((l) => WeatherError(l.message), (r) {
      wea = r;
      return WeatherLoaded(weather: r, forecast: const []);
    }));
    emit(forecast.fold((l) => WeatherError(l.message),
        (r) => WeatherLoaded(forecast: r, weather: wea)));
  }

  /// Get weather bloc
  Future<void> getCurrentWeatherByCityBloc(
      LoadCustomWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    late Weather wea;
    final weather = await getCurrentWeatherByCity(StringParams(event.city));
    final forecast = await getForecastWeatherByCity(StringParams(event.city));
    emit(weather.fold((l) => WeatherError(l.message), (r) {
      wea = r;
      return WeatherLoaded(weather: r, forecast: const []);
    }));
    emit(forecast.fold((l) => WeatherError(l.message),
        (r) => WeatherLoaded(forecast: r, weather: wea)));
  }

  /// Get weather bloc
  Future<void> getWeatherByLocationBloc(
      LoadCustomWeatherLocation event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    late Weather wea;
    final weather = await getCurrentWeatherByLocation(
        GCWBLParams(latitude: event.latitude, longitude: event.longitude));
    final forecast = await getForecastWeatherByLocation(
        GFWBLParams(latitude: event.latitude, longitude: event.longitude));
    emit(weather.fold((l) => WeatherError(l.message), (r) {
      wea = r;
      return WeatherLoaded(weather: r, forecast: const []);
    }));
    emit(forecast.fold((l) => WeatherError(l.message),
        (r) => WeatherLoaded(forecast: r, weather: wea)));
  }

  /// Get weather forecast bloc
  // Future<List<Weather>?> getForecastWeatherBloc() async {
  //   final result = await getForecastWeather(NoParams());
  //   return result.fold((l) => null, (r) => r);
  // }

  // /// Get weather forecast bloc
  // Future<List<Weather>?> getForecastWeatherByCityBloc(String city) async {
  //   final result = await getForecastWeatherByCity(StringParams(city));
  //   return result.fold((l) => null, (r) => r);
  // }
}
