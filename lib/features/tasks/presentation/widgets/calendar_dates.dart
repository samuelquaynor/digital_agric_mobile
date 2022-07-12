import 'package:flutter/material.dart';

class CalendarDates extends StatelessWidget {
  const CalendarDates({
    required this.day,
    required this.date,
    required this.dayColor,
    required this.dateColor,
  });
  final String day;
  final String date;
  final Color dayColor;
  final Color dateColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          Text(
            day,
            style: TextStyle(
                fontSize: 16, color: dayColor, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Text(
            date,
            style: TextStyle(
                fontSize: 16, color: dateColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
