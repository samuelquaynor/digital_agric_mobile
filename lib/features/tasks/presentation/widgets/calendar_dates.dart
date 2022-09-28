import 'package:flutter/material.dart';

/// Calendar Dates
class CalendarDates extends StatelessWidget {
  /// Constructor
  const CalendarDates({
    super.key,
    required this.day,
    required this.date,
    required this.dayColor,
    required this.dateColor,
  });

  /// Calendar day
  final String day;

  /// Calendar date
  final String date;

  /// Calendar day color
  final Color dayColor;

  /// Calendar date color
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
