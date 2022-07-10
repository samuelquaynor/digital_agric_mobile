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
  static const IconData clear_day = _IconData(0xf00d);
  static const IconData clear_night = _IconData(0xf02e);

  static const IconData few_clouds_day = _IconData(0xf002);
  static const IconData few_clouds_night = _IconData(0xf081);

  static const IconData clouds_day = _IconData(0xf07d);
  static const IconData clouds_night = _IconData(0xf080);

  static const IconData shower_rain_day = _IconData(0xf009);
  static const IconData shower_rain_night = _IconData(0xf029);

  static const IconData rain_day = _IconData(0xf008);
  static const IconData rain_night = _IconData(0xf028);

  static const IconData thunder_storm_day = _IconData(0xf010);
  static const IconData thunder_storm_night = _IconData(0xf03b);

  static const IconData snow_day = _IconData(0xf00a);
  static const IconData snow_night = _IconData(0xf02a);

  static const IconData mist_day = _IconData(0xf003);
  static const IconData mist_night = _IconData(0xf04a);

 static IconData getIconData(String iconCode) {
    switch (iconCode) {
      case '01d':
        return WeatherIcons.clear_day;
      case '01n':
        return WeatherIcons.clear_night;
      case '02d':
        return WeatherIcons.few_clouds_day;
      case '02n':
        return WeatherIcons.few_clouds_day;
      case '03d':
      case '04d':
        return WeatherIcons.clouds_day;
      case '03n':
      case '04n':
        return WeatherIcons.clear_night;
      case '09d':
        return WeatherIcons.shower_rain_day;
      case '09n':
        return WeatherIcons.shower_rain_night;
      case '10d':
        return WeatherIcons.rain_day;
      case '10n':
        return WeatherIcons.rain_night;
      case '11d':
        return WeatherIcons.thunder_storm_day;
      case '11n':
        return WeatherIcons.thunder_storm_night;
      case '13d':
        return WeatherIcons.snow_day;
      case '13n':
        return WeatherIcons.snow_night;
      case '50d':
        return WeatherIcons.mist_day;
      case '50n':
        return WeatherIcons.mist_night;
      default:
        return WeatherIcons.clear_day;
    }
  }
}
