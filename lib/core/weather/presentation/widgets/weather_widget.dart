import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

import 'forecast_horizontal_widget.dart';
import 'value_tile.dart';
import 'weather_swipe_pager.dart';

/// Weather forecast widget
class WeatherWidget extends StatefulWidget {
  /// Constructor
  const WeatherWidget(
      {super.key, required this.weather, required this.forecast});

  /// Weather model
  final Weather weather;

  /// list of weather
  final List<Weather> forecast;

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.weather.areaName!.toUpperCase(),
          style: const TextStyle(
            fontSize: 25,
            letterSpacing: 5,
            color: Color.fromARGB(255, 14, 65, 17),
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          widget.weather.weatherDescription!.toUpperCase(),
          style: const TextStyle(
            fontSize: 15,
            letterSpacing: 5,
            fontWeight: FontWeight.w100,
          ),
        ),
        WeatherSwipePager(
          weather: widget.weather,
          forecast: widget.forecast,
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Divider(),
        ),
        ForecastHorizontal(weathers: widget.forecast),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ValueTile(
                label: 'wind speed', value: '${widget.weather.windSpeed} m/s'),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: SizedBox(
                width: 1,
                height: 30,
              )),
            ),
            ValueTile(
              label: 'sunrise',
              value: DateFormat('h:m a').format(widget.weather.sunrise!),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: SizedBox(
                width: 1,
                height: 30,
              )),
            ),
            ValueTile(
                label: 'sunset',
                value: DateFormat('h:m a').format(widget.weather.sunset!)),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Center(
                  child: SizedBox(
                width: 1,
                height: 30,
              )),
            ),
            ValueTile(label: 'humidity', value: '${widget.weather.humidity}%'),
          ],
        ),
      ],
    ));
  }
}
