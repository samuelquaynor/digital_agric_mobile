
  import 'dart:math';

/// round double by decimal places
  double roundDouble(double value, int places) {
    final mod = pow(10.0, places);
    return (value * mod).round().toDouble() / mod;
  }