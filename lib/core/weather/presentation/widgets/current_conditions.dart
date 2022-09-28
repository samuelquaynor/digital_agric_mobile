import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import '../../../util/converters.dart';
import '../../../util/weather_icon_mapper.dart';
import 'value_tile.dart';

/// Renders Weather Icon, current, min and max temperatures
class CurrentConditions extends StatelessWidget {
  ///Constructor
  const CurrentConditions({super.key, required this.weather});

  ///Weather
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          WeatherIcons.getIconData(weather.weatherIcon!),
          size: 70,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${roundDouble(weather.temperature?.celsius ?? 0, 1)}°',
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w100,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ValueTile(
              label: 'max',
              value: '${roundDouble(weather.tempMax?.celsius ?? 0, 1)}°'),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: SizedBox(
              width: 1,
              height: 30,
            )),
          ),
          ValueTile(
              label: 'min',
              value: '${roundDouble(weather.tempMin?.celsius ?? 0, 1)}°'),
        ]),
      ],
    );
  }
}
