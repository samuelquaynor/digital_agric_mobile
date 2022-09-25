import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/weather/presentation/bloc/weather_bloc.dart';
import '../../../../core/weather/presentation/pages/full_weather_screen.dart';
import '../../../../core/weather/presentation/widgets/display_weather_widget.dart';
import '../../domain/entities/farm_entity.dart';

/// Single  Farm Page
class SingleFarmPage extends StatefulWidget {
  /// Constructor
  const SingleFarmPage({super.key, required this.farm});

  /// Farm Entity
  final FarmEntity farm;

  @override
  State<SingleFarmPage> createState() => _SingleFarmPageState();
}

class _SingleFarmPageState extends State<SingleFarmPage> {
  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(LoadCustomWeatherLocation(
        latitude: widget.farm.latitude, longitude: widget.farm.longitude));
    return Scaffold(
        body: DraggableHome(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.green.shade900),
                onPressed: () => Navigator.of(context).pop()),
            headerExpandedHeight: 0.45,
            title: Text(widget.farm.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            alwaysShowLeadingAndAction: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.star_border,
                      color: Colors.white, size: 22))
            ],
            headerWidget: SafeArea(
                child: FadeInImage(
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/farm.jpg')),
                                borderRadius: BorderRadius.circular(15))),
                    placeholder: const AssetImage(
                        'assets/images/logo-white-transparentbg.png'),
                    image: const NetworkImage('avatarUrl'))),
            body: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                    if (state is WeatherLoading) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: CircularProgressIndicator.adaptive()));
                    } else if (state is WeatherLoaded) {
                      return GestureDetector(
                          onTap: () => Navigator.of(context).push<void>(
                              MaterialPageRoute(
                                  builder: (context) => WeatherScreen(
                                      weather: state.weather!,
                                      forecast: state.forecast))),
                          child: DisplayWeather(weather: state.weather!));
                    } else {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text('Weather Loading Error'));
                    }
                  }))
            ]));
  }
}
