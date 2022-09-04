import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/data/hive_adapters.dart';
import 'core/presentation/widgets/light_theme.dart';
import 'core/user/domain/usecases/retrieveUser.dart';
import 'core/weather/presentation/bloc/weather_bloc.dart';
import 'features/home/presentation/pages/home.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/news/presentation/bloc/news_bloc.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  await HiveAdapters.setUp();
  await di.sl<RetrieveUser>().call(const RetrieveUserParams(localUser: false));
  // ignore: avoid_bool_literals_in_conditional_expressions
  final isLoggedIn = FirebaseAuth.instance.currentUser == null ? false : true;
  // await HiveAdapters.setUp();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<WeatherBloc>()),
        BlocProvider(create: (context) => sl<NewsBloc>())
      ],
      child: MaterialApp(
          title: 'DigiFarm',
          // darkTheme: darkTheme,
          theme: lightTheme,
          home: isLoggedIn ? const HomeScreen() : const LoginPage())));
  await AwesomeNotifications()
      .initialize('resource://drawable/res_notification_app_icon', [
    NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.green,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: ''),
    NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: Colors.teal,
        locked: true,
        importance: NotificationImportance.High,
        channelDescription: '')
  ]);
}
