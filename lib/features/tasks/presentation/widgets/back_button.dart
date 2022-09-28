import 'package:flutter/material.dart';

/// Custom back button
class MyBackButton extends StatelessWidget {
  /// Constructor
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'backButton',
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_back,
            color: Colors.green.shade900,
          ),
        ),
      ),
    );
  }
}
