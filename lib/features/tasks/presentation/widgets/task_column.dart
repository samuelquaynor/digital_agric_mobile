import 'package:flutter/material.dart';

/// Task Column
class TaskColumn extends StatelessWidget {
  /// Constructor
  const TaskColumn({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
  });

  /// Task Column icon
  final IconData icon;

  /// Task Column icon color
  final Color iconBackgroundColor;

  /// Task Column title
  final String title;

  /// Task Column subtitle
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 20,
          backgroundColor: iconBackgroundColor,
          child: Icon(
            icon,
            size: 15,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45),
            ),
          ],
        )
      ],
    );
  }
}
