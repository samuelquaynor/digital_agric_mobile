import 'package:flutter/material.dart';

import '../widgets/dashboard_screen.dart';
import '../widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: DashboardScreen(),
      ), 
    );
  }
}
