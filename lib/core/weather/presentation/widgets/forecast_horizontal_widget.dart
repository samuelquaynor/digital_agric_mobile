import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

import '../../../util/WeatherIconMapper.dart';
import '../../../util/converters.dart';
import 'value_tile.dart';

/// Renders a horizontal scrolling list of weather conditions
/// Used to show forecast
/// Shows DateTime, Weather Condition icon and Temperature
class ForecastHorizontal extends StatelessWidget {
  ///Constructor
  const ForecastHorizontal({
    super.key,
    required this.weathers,
  });

  ///List of Weathers
  final List<Weather?> weathers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: weathers.length,
        separatorBuilder: (context, index) => const Divider(
          height: 100,
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = weathers[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: ValueTile(
              value: DateFormat('E, ha').format(item!.date!),
              label: '${roundDouble(item.temperature?.celsius ?? 0, 1)}°',
              iconData: WeatherIcons.getIconData(item.weatherIcon!),
            )),
          );
        },
      ),
    );
  }
}
