import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/weather/presentation/bloc/weather_bloc.dart';
import '../../../../core/weather/presentation/pages/full_weather_screen.dart';
import '../../../../core/weather/presentation/widgets/display_weather_widget.dart';
import '../../../../injection_container.dart';
import '../../../predictions/domain/entities/crop_info.dart';
import '../../../predictions/presentation/bloc/predictions_bloc.dart';
import '../../../predictions/presentation/pages/crop_info.dart';
import '../../../predictions/presentation/pages/scan_crop.dart';
import '../../../predictions/presentation/widgets/prediction_carousel.dart';

/// Home Dashboard
class Dashboard extends StatefulWidget {
  /// Constructor
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final bloc = sl<PredictionsBloc>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset('assets/images/logo.png',
                    width: 100, height: 100)),
            leadingWidth: 30,
            title: Text('DigiFarm',
                style: Theme.of(context).textTheme.titleMedium),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined)),
              // IconButton(onPressed: () {}, icon: const Icon(Icons.apps_rounded))
            ]),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: ListView(shrinkWrap: true, children: [
              Text('Dashboard',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.w600)),
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
              ListTile(
                  title: Text('Prediction Algorithms',
                      style: Theme.of(context).textTheme.titleMedium),
                  trailing: const Icon(Icons.arrow_forward)),
              SizedBox(
                height: 220,
                child: PredictionCarousel(
                    title: 'Plant Disease Detection',
                    urlImage: 'assets/images/weed-detect.png',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const ScanCrop()));
                    },
                    description:
                        'Plant Disease Detection Accepts a POST request with an image in the form of base64 string and returns plant, disease and remedy.'),
              ),
              ListTile(
                  title: Text('Plants Info',
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: const Text('Check more info of plants here'),
                  trailing: const Icon(Icons.arrow_forward)),
              FutureBuilder<List<CropInfo?>>(
                  future: bloc.getCropInfoBloc(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LinearProgressIndicator();
                    } else {
                      return SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemBuilder: (context, index) =>
                                  Column(children: [
                                    GestureDetector(
                                        onTap: () => Navigator.of(context).push<void>(MaterialPageRoute(
                                            builder: (context) => CropInfoScreen(
                                                cropInfo:
                                                    snapshot.data?[index]))),
                                        child: Container(
                                            width: 120,
                                            height: 120,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.green
                                                          .withOpacity(0.2),
                                                      blurRadius: 5,
                                                      spreadRadius: 3,
                                                      offset:
                                                          const Offset(0, 5))
                                                ]),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: FadeInImage(
                                                    imageErrorBuilder: (context, error, stackTrace) =>
                                                        Image.asset('assets/images/rice.png', fit: BoxFit.cover),
                                                    fit: BoxFit.cover,
                                                    placeholder: const AssetImage('assets/images/rice.png'),
                                                    image: NetworkImage(snapshot.data?[index]?.photoUrl ?? '', scale: 1.5))))),
                                    Text(snapshot.data?[index]?.name ?? '')
                                  ]),
                              itemCount: snapshot.data?.length,
                              scrollDirection: Axis.horizontal));
                    }
                  })
            ])));
  }
}
