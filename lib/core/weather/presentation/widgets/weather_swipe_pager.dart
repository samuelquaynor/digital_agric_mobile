import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import 'current_conditions.dart';
import 'empty_widget.dart';
import 'temperature_line_chart.dart';

class WeatherSwipePager extends StatelessWidget {
  const WeatherSwipePager({
    super.key,
    required this.weather,
    required this.forecast,
  });

  final Weather weather;
  final List<Weather> forecast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 350,
      child: Swiper(
        itemCount: 2,
        index: 0,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CurrentConditions(
              weather: weather,
            );
          } else if (index == 1) {
            return TemperatureLineChart(
              animate: true,
              weathers: forecast,
            );
          }
          return EmptyWidget();
        },
        pagination: const SwiperPagination(
          margin: EdgeInsets.all(15),
          builder: DotSwiperPaginationBuilder(
            size: 5,
            activeSize: 5,
          ),
        ),
      ),
    );
  }
}
