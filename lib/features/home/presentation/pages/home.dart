import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/weather/presentation/bloc/weather_bloc.dart';
import '../../../../injection_container.dart';
import '../../../farms/presentation/pages/farms_page.dart';
import '../../../news/presentation/pages/news_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../../../stocks/presentation/pages/stocks_page.dart';
import 'dashboard.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pages = [
    const Dashboard(),
    const FarmsPage(),
    const StocksPage(),
    const NewsPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(
          const LoadWeather(),
        );
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green.shade900,
          borderRadius: BorderRadius.circular(35),
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() {
            _currentIndex = i;
          }),
          selectedItemColor: Colors.black,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              title: const Text('Home'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.plantWilt,
                size: 20,
              ),
              title: const Text('Farms'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.chartBar,
                size: 20,
              ),
              title: const Text('Stocks'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.newspaper,
                size: 20,
              ),
              title: const Text('News'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.gear,
                size: 20,
              ),
              title: const Text('Settings'),
              selectedColor: Colors.white,
              unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            ),
          ],
        ),
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}
