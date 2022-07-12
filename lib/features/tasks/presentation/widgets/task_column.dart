import 'package:flutter/material.dart';

class TaskColumn extends StatelessWidget {
  const TaskColumn({
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
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
