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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data["location"] = location?.toJson();
    }
    data["precise"] = precise;
    data["confidence"] = confidence;
    data["level"] = level;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lng"] = lng;
    data["lat"] = lat;
    return data;
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
