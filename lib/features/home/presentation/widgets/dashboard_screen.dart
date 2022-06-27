import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';
import 'header.dart';
import 'my_files.dart';
import 'recent_files.dart';
import 'storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
