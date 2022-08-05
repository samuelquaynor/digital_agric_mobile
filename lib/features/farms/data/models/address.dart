class Address {
  Address(
      {this.longitude,
      this.latitude,
      this.placeFormattedAddress,
      this.placeId,
      this.placeName});
  String? placeName;
  double? latitude;
  double? longitude;
  String? placeId;
  String? placeFormattedAddress;
}
