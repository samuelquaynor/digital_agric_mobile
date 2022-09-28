/// Prediction model
// ignore_for_file: avoid_dynamic_calls

class Prediction {
  /// Constructor
  Prediction({
    this.placeId,
    this.mainText,
    this.secondaryText,
  });

  /// prediction convert from json
  Prediction.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'] as String;
    mainText = json['structured_formatting']['main_text'] as String;
    secondaryText = json['structured_formatting']['secondary_text'] as String;
  }

  /// Prediction place id
  String? placeId;

  /// Prediction main text
  String? mainText;

  /// Prediction secondary text
  String? secondaryText;
}
