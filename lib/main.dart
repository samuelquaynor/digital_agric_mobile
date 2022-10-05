import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/data/hive_adapters.dart';
import 'core/platform/notifications.dart';
import 'core/presentation/widgets/light_theme.dart';
import 'core/user/domain/usecases/retrieve_user.dart';
import 'core/weather/presentation/bloc/weather_bloc.dart';
import 'features/home/presentation/pages/home.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  await HiveAdapters.setUp();
  await di.sl<RetrieveUser>().call(const RetrieveUserParams(localUser: false));
  // ignore: avoid_bool_literals_in_conditional_expressions
  final isLoggedIn = FirebaseAuth.instance.currentUser == null ? false : true;
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di.sl<WeatherBloc>())],
      child: NotificationHandler(
        child: MaterialApp(
            title: 'DigiFarm',
            // darkTheme: darkTheme,
            theme: lightTheme,
            home: isLoggedIn ? const HomeScreen() : const LoginPage()),
      )));
}
