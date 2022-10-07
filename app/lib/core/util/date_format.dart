import 'package:intl/intl.dart';

/// Format Date standard
class DateFormatter {
  /// Formats date into hour and minute, eg: 10:15am
  static String toHourMinute(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat.jm();
    return formatter.format(parsedDate);
  }

  /// Formats date into year,month and day eg: 1st August, 2021
  static String toDate(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat.yMMMd();
    return formatter.format(parsedDate);
  }

  /// Formats date into day,hour and minute eg: 1st August, 2021 7:00pm
  static String toDayHourMinute(String date) {
    final parsedDate = DateTime.parse(date);
    final hour = DateFormat.jm();
    final day = DateFormat.yMMMd();
    return '${day.format(parsedDate)}, ${hour.format(parsedDate)}';
  }

  /// Formats date into day,month eg: Monday, 7 Jun
  static String toDayMonth(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat.yMMMd();
    return formatter.format(parsedDate);
  }

  /// Formats date into date,day eg: Mon, 7
  static String toDateDay(String date) {
    final parsedDate = DateTime.parse(date);
    final formatter = DateFormat('E,d');
    return formatter.format(parsedDate);
  }

  /// Formats date into time eg: 3pm
  static String toTime(String time) {
    final formatter = DateFormat.jm();
    return formatter.format(DateFormat('hh:mm').parse(time));
  }

  /// Convert time to date
  static DateTime convertToDate({required String date, required String time}) {
    final parsedDate = DateTime.parse(date);
    final split = time.split(':');
    final hour = split.first;
    final minutes = split.last;
    return parsedDate
        .add(Duration(hours: int.parse(hour), minutes: int.parse(minutes)));
  }
}
