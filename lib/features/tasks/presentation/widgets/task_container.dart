import 'package:flutter/material.dart';

/// Task Container
class TaskContainer extends StatelessWidget {
  /// Constructor
  const TaskContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.boxColor,
  });

  /// Task Container title
  final String title;

  /// Task Container sub title
  final String subtitle;

  /// Task Container box color
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
