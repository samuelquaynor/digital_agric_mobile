import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/weather/presentation/bloc/weather_bloc.dart';
import '../../../../core/weather/presentation/pages/full_weather_screen.dart';
import '../../../../core/weather/presentation/widgets/display_weather_widget.dart';
import '../../../../injection_container.dart';
import '../../../farms/domain/entities/farm_entity.dart';
import '../../../farms/presentation/bloc/farms_bloc.dart';
import '../../../shop/presentation/widgets/agric_store_widget.dart';
import '../../../tasks/presentation/pages/tasks_page.dart';
import '../../../tasks/presentation/widgets/tasks_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final bloc = sl<FarmsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child:
                    Image.asset('assets/images/logo-white-transparentbg.png')),
            leadingWidth: 30,
            title: Text('DigiFarm',
                style: Theme.of(context).textTheme.titleMedium),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.apps_rounded))
            ]),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Dashboard',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.w600)),
              // Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: 50,
              //     margin: const EdgeInsets.symmetric(vertical: 16),
              //     child: ListView.builder(
              //         itemBuilder: (context, index) => Container(
              //               width: 120,
              //               margin: const EdgeInsets.symmetric(
              //                   vertical: 6, horizontal: 3),
              //               decoration: BoxDecoration(
              //                 color: Colors.green,
              //                 borderRadius: BorderRadius.circular(20),
              //               ),
              //             ),
              //         scrollDirection: Axis.horizontal,
              //         itemCount: 5)),
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherLoading) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(vertical: 6),
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
              }),
              const AgricStore(),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (context) => const TasksPage())),
                  title: Text('Current Tasks',
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: const Text('create tasks for farms'),
                  trailing: const Icon(Icons.arrow_forward)),
              FutureBuilder(
                  future: bloc.getFarmsBloc(),
                  builder:
                      (context, AsyncSnapshot<List<FarmEntity?>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No Farms Avaliable Hence No Task'),
                        );
                      } else {
                        return TasksWidget(
                          farms: snapshot.data ?? [],
                        );
                      }
                    } else {
                      return const LinearProgressIndicator();
                    }
                  })
            ])));
  }
}
