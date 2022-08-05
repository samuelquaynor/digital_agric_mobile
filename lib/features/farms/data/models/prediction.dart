
class Prediction {

  Prediction({
    this.placeId,
    this.mainText,
    this.secondaryText,
  });

  Prediction.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'] as String;
    mainText = json['structured_formatting']['main_text'] as String;
    secondaryText = json['structured_formatting']['secondary_text'] as String;
  }
  String? placeId;
  String? mainText;
  String? secondaryText;
}
