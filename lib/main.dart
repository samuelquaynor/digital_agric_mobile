import 'package:flutter/material.dart';

import 'core/presentation/widgets/dark_theme.dart';
import 'core/presentation/widgets/light_theme.dart';
import 'features/login/presentation/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await HiveAdapters.setUp();
  runApp(
    MaterialApp(
        title: 'DigiFarm',
        darkTheme: darkTheme,
        theme: lightTheme,
        home: LoginPage()),
  );
}
