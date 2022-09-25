import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

import '../../../../injection_container.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/weather_widget.dart';

/// OptionsMenu
enum OptionsMenu { changeCity, settings }

/// Full Weather Screen
class WeatherScreen extends StatefulWidget {
  ///Constructor
  const WeatherScreen(
      {super.key, required this.weather, required this.forecast});

  ///Weather
  final Weather weather;
  final List<Weather?> forecast;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final bloc = sl<WeatherBloc>();

  final cityName = ValueNotifier<String>('');
  String _cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Text(
              DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
              style: TextStyle(color: Colors.green.shade900, fontSize: 14),
            ),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                color: Colors.green.shade900),
            backgroundColor: Colors.white,
            actions: <Widget>[
              PopupMenuButton<OptionsMenu>(
                  onSelected: _onOptionMenuItemSelected,
                  itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
                        PopupMenuItem<OptionsMenu>(
                            value: OptionsMenu.changeCity,
                            child: Text('Change City',
                                style: TextStyle(
                                    color: Colors.green.shade900,
                                    fontSize: 14)))
                        // const PopupMenuItem<OptionsMenu>(
                        //   value: OptionsMenu.settings,
                        //   child: Text('settings'),
                        // ),
                      ],
                  child: const Icon(Icons.more_vert))
            ]),
        body: BlocBuilder<WeatherBloc, WeatherState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WeatherLoaded) {
                return WeatherWidget(
                    weather: state.weather!,
                    forecast: state.forecast as List<Weather>);
              } else {
                const errorText = 'There was an error fetching weather data';
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.error_outline,
                          color: Colors.redAccent, size: 24),
                      const SizedBox(height: 10),
                      const Text(errorText,
                          style: TextStyle(color: Colors.red)),
                      TextButton(
                          onPressed: () => context
                              .read<WeatherBloc>()
                              .add(LoadCustomWeather(_cityName)),
                          child: const Text('Try Again'))
                    ]);
              }
            }));
  }

  // Future<void> _fetchWeatherWithCity() async {
  //   final newWeather = await bloc.getCurrentWeatherByCityBloc(_cityName);
  //   final newForecast = await bloc.getForecastWeatherByCityBloc(_cityName);
  //   setState(() {
  //     weatherChange = newWeather!;
  //     forecastchange = newForecast!;
  //   });
  //   print(weatherChange);
  // }

  Future _showCityChangeDialog() {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Change City', style: TextStyle(fontSize: 16)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  context.read<WeatherBloc>().add(LoadCustomWeather(_cityName));
                  Navigator.of(context).pop();
                },
                child: const Text('Search'),
              ),
            ],
            content: TextField(
              autofocus: true,
              onChanged: (text) {
                _cityName = text;
              },
              decoration: const InputDecoration(
                  hintText: 'Name of your city',
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                  suffixIcon: Icon(
                    Icons.my_location,
                    color: Colors.black,
                    size: 16,
                  )),
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
          );
        });
  }

  void _onOptionMenuItemSelected(OptionsMenu item) {
    switch (item) {
      case OptionsMenu.changeCity:
        _showCityChangeDialog();
        break;
      case OptionsMenu.settings:
        // TODO: Handle this case.
        break;
    }
  }
}
