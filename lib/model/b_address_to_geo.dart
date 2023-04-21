class BAddressToGeo {
  Location? location;
  int? precise;
  int? confidence;
  String? level;

  BAddressToGeo({this.location, this.precise, this.confidence, this.level});

  BAddressToGeo.fromJson(Map<String, dynamic> json) {
    location =
        json["location"] == null ? null : Location.fromJson(json["location"]);
    precise = json["precise"];
    confidence = json["confidence"];
    level = json["level"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (location != null) {
      _data["location"] = location?.toJson();
    }
    _data["precise"] = precise;
    _data["confidence"] = confidence;
    _data["level"] = level;
    return _data;
  }

  BAddressToGeo copyWith({
    Location? location,
    int? precise,
    int? confidence,
    String? level,
  }) =>
      BAddressToGeo(
        location: location ?? this.location,
        precise: precise ?? this.precise,
        confidence: confidence ?? this.confidence,
        level: level ?? this.level,
      );
}

class Location {
  double? lng;
  double? lat;

  Location({this.lng, this.lat});

  Location.fromJson(Map<String, dynamic> json) {
    lng = json["lng"];
    lat = json["lat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lng"] = lng;
    _data["lat"] = lat;
    return _data;
  }

  Location copyWith({
    double? lng,
    double? lat,
  }) =>
      Location(
        lng: lng ?? this.lng,
        lat: lat ?? this.lat,
      );
}
