/// [Exception] thrown for server related errors and device errors
class DeviceException implements Exception {
  /// Constructor
  DeviceException(this.message);

  /// Error message
  final String message;

  @override
  String toString() => message;
}
