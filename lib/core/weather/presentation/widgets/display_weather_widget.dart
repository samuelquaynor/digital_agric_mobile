import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/weather.dart';

import '../../../util/converters.dart';
import '../../../util/date_format.dart';

/// Display weather container
class DisplayWeather extends StatelessWidget {
  /// constructor
  const DisplayWeather({
    super.key,
    required this.weather,
  });

  /// weather info
  final Weather weather;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Weather forecast',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(20),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${roundDouble(weather.temperature?.celsius ?? 0, 1)}°C ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${roundDouble(weather.tempMin?.celsius ?? 0, 1)}°C ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormatter.toDayHourMinute(weather.date.toString()),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.droplet,
                            size: 14,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            ' ${weather.humidity}%',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.speed,
                            size: 20,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            ' ${weather.windSpeed}m/s',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
