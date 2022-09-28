/// Address Model
class Address {
  /// Constructor
  Address(
      {this.longitude,
      this.latitude,
      this.placeFormattedAddress,
      this.placeId,
      this.placeName});

  /// Address place name
  String? placeName;

  /// Address latitude
  double? latitude;

  /// Address longitude
  double? longitude;

  /// Address place id
  String? placeId;

  /// Address formatted address
  String? placeFormattedAddress;
}
