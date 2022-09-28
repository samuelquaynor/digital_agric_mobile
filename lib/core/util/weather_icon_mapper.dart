import 'package:flutter/material.dart';

class _IconData extends IconData {
  const _IconData(super.codePoint)
      : super(
          fontFamily: 'WeatherIcons',
        );
}

/// Exposes specific weather icons
/// Has all weather conditions specified by open weather maps API
/// https://openweathermap.org/weather-conditions
// hex values and ttf file from https://erikflowers.github.io/weather-icons/
class WeatherIcons {
  /// Clear day icon data
  static const IconData clearDay = _IconData(0xf00d);

  /// Clear night icon data
  static const IconData clearNight = _IconData(0xf02e);

  /// few cloud day icon data
  static const IconData fewCloudsDay = _IconData(0xf002);

  /// few clouds night icon data
  static const IconData fewCloudsNight = _IconData(0xf081);

  /// Clouds day icon data
  static const IconData cloudsDay = _IconData(0xf07d);

  /// Clouds night icon data
  static const IconData cloudsNight = _IconData(0xf080);

  /// Shower rain day icon data
  static const IconData showerRainday = _IconData(0xf009);

  /// Shower rain night icon data
  static const IconData showerRainNight = _IconData(0xf029);

  /// Rain day icon data
  static const IconData rainDay = _IconData(0xf008);

  /// Rain night icon data
  static const IconData rainNight = _IconData(0xf028);

  /// Thunder stirn day icon data
  static const IconData thunderStormDay = _IconData(0xf010);

  /// Thunder storm night icon data
  static const IconData thunderStormNight = _IconData(0xf03b);

  /// Snow day icon data
  static const IconData snowDay = _IconData(0xf00a);

  /// Snow night icon data
  static const IconData snowNight = _IconData(0xf02a);

  /// Mist day icon data
  static const IconData mistDay = _IconData(0xf003);

  /// Mist night icon data
  static const IconData mistNight = _IconData(0xf04a);

  /// get corresponding day icon data
  static IconData getIconData(String iconCode) {
    switch (iconCode) {
      case '01d':
        return WeatherIcons.clearDay;
      case '01n':
        return WeatherIcons.clearNight;
      case '02d':
        return WeatherIcons.fewCloudsDay;
      case '02n':
        return WeatherIcons.fewCloudsDay;
      case '03d':
      case '04d':
        return WeatherIcons.cloudsDay;
      case '03n':
      case '04n':
        return WeatherIcons.clearNight;
      case '09d':
        return WeatherIcons.showerRainday;
      case '09n':
        return WeatherIcons.showerRainNight;
      case '10d':
        return WeatherIcons.rainDay;
      case '10n':
        return WeatherIcons.rainNight;
      case '11d':
        return WeatherIcons.thunderStormDay;
      case '11n':
        return WeatherIcons.thunderStormNight;
      case '13d':
        return WeatherIcons.snowDay;
      case '13n':
        return WeatherIcons.snowNight;
      case '50d':
        return WeatherIcons.mistDay;
      case '50n':
        return WeatherIcons.mistNight;
      default:
        return WeatherIcons.clearDay;
    }
  }
}
