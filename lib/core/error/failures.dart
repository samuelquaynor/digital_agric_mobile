import 'dart:convert';

import 'package:equatable/equatable.dart';

/// General failures
class Failure extends Equatable {
  /// Constructor
  const Failure(this.message);

  /// Error message
  final String message;

  @override
  String toString() => _utf8convert(message);

  static String _utf8convert(String text) {
    final bytes = text.codeUnits;
    return utf8.decode(bytes);
  }

  @override
  List<Object> get props => [message];
}
