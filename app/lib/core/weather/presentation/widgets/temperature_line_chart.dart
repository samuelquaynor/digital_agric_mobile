import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

/// Renders a line chart from forecast data
/// x axis - date
/// y axis - temperature
class TemperatureLineChart extends StatelessWidget {
  /// Constructor
  const TemperatureLineChart(
      {super.key, required this.weathers, required this.animate});

  /// weather forecast
  final List<Weather> weathers;

  /// animate line chart
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: charts.TimeSeriesChart(
        [
          charts.Series<Weather, DateTime>(
            id: 'Temperature',
            colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
            domainFn: (Weather weather, _) => weather.date!,
            measureFn: (Weather weather, _) => weather.temperature!.celsius,
            data: weathers,
          )
        ],
        animate: animate,
        animationDuration: const Duration(milliseconds: 500),
        primaryMeasureAxis: const charts.NumericAxisSpec(
          tickProviderSpec: charts.BasicNumericTickProviderSpec(
            zeroBound: false,
          ),
        ),
      ),
    );
  }
}
