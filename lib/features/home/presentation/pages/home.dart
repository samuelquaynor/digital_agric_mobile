import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/weather/presentation/bloc/weather_bloc.dart';
import '../../../../injection_container.dart';
import '../../../farms/presentation/pages/farms_dashboard_page.dart';
import '../../../news/presentation/pages/news_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
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
    const DashboardFarmsPage(),
    // const StocksPage(),
    const NewsPage(),
    const SettingsPage()
  ];

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
                    title: const Text('Allow Notifications'),
                    content: const Text(
                        'Our app would like to send you notifications'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Don't Allow",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      TextButton(
                          onPressed: () => AwesomeNotifications()
                              .requestPermissionToSendNotifications()
                              .then((_) => Navigator.pop(context)),
                          child: const Text('Allow',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)))
                    ]));
      }
    });
  }

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

            /// Farms
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
            // SalomonBottomBarItem(
            //   icon: const Icon(
            //     FontAwesomeIcons.chartBar,
            //     size: 20,
            //   ),
            //   title: const Text('Stocks'),
            //   selectedColor: Colors.white,
            //   unselectedColor: const Color.fromARGB(255, 140, 221, 143),
            // ),

            /// News
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
