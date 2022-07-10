import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/weather/presentation/bloc/weather_bloc.dart';
import '../../../../core/weather/presentation/pages/full_weather_screen.dart';
import '../../../../core/weather/presentation/widgets/display_weather_widget.dart';
import '../../../../injection_container.dart';

///HomeScreen
class HomeScreen extends StatefulWidget {
  ///Constructor
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  final bloc = sl<WeatherBloc>();
  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(
          const LoadWeather(),
        );
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset('assets/images/logo-white-transparentbg.png'),
        ),
        leadingWidth: 30,
        title: Text('DigiFarm', style: Theme.of(context).textTheme.titleMedium),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.apps_rounded)),
          Image.asset('assets/images/profile_pic.png')
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green.shade900,
          borderRadius: BorderRadius.circular(35),
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          selectedItemColor: Colors.black,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.house, size: 20,),
              title: const Text('Home'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.plantWilt, size: 20,),
              title: const Text('Farms'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.chartBar, size: 20,),
              title: const Text('Stocks'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.newspaper, size: 20,),
              title: const Text('News'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.gear, size: 20,),
              title: const Text('Settings'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                          width: 120,
                          margin: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 3),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5)),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                } else if (state is WeatherLoaded) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push<void>(
                      MaterialPageRoute(
                        builder: (context) =>
                            WeatherScreen(weather: state.weather!, forecast: state.forecast,),
                      ),
                    ),
                    child: DisplayWeather(
                      weather: state.weather!,
                    ),
                  );
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Weather Loading Error'),
                  );
                }
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Current tasks',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
