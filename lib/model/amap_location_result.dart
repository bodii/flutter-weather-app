class AmapLocationResult {
  String? callbackTime;
  String? locationTime;
  int? locationType;
  double? latitude;
  double? longitude;
  int? accuracy;
  int? altitude;
  int? bearing;
  int? speed;
  String? country;
  String? province;
  String? city;
  String? district;
  String? street;
  String? streetNumber;
  String? cityCode;
  String? adCode;
  String? address;
  String? description;

  AmapLocationResult(
      {this.callbackTime,
      this.locationTime,
      this.locationType,
      this.latitude,
      this.longitude,
      this.accuracy,
      this.altitude,
      this.bearing,
      this.speed,
      this.country,
      this.province,
      this.city,
      this.district,
      this.street,
      this.streetNumber,
      this.cityCode,
      this.adCode,
      this.address,
      this.description});

  AmapLocationResult.fromJson(Map<String, dynamic> json) {
    if (json["callbackTime"] is String) {
      callbackTime = json["callbackTime"];
    }
    if (json["locationTime"] is String) {
      locationTime = json["locationTime"];
    }
    if (json["locationType"] is int) {
      locationType = json["locationType"];
    }
    if (json["latitude"] is double) {
      latitude = json["latitude"];
    }
    if (json["longitude"] is double) {
      longitude = json["longitude"];
    }
    if (json["accuracy"] is int) {
      accuracy = json["accuracy"];
    }
    if (json["altitude"] is int) {
      altitude = json["altitude"];
    }
    if (json["bearing"] is int) {
      bearing = json["bearing"];
    }
    if (json["speed"] is int) {
      speed = json["speed"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["province"] is String) {
      province = json["province"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["district"] is String) {
      district = json["district"];
    }
    if (json["street"] is String) {
      street = json["street"];
    }
    if (json["streetNumber"] is String) {
      streetNumber = json["streetNumber"];
    }
    if (json["cityCode"] is String) {
      cityCode = json["cityCode"];
    }
    if (json["adCode"] is String) {
      adCode = json["adCode"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
  }

  static List<AmapLocationResult> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AmapLocationResult.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData["callbackTime"] = callbackTime;
    jsonData["locationTime"] = locationTime;
    jsonData["locationType"] = locationType;
    jsonData["latitude"] = latitude;
    jsonData["longitude"] = longitude;
    jsonData["accuracy"] = accuracy;
    jsonData["altitude"] = altitude;
    jsonData["bearing"] = bearing;
    jsonData["speed"] = speed;
    jsonData["country"] = country;
    jsonData["province"] = province;
    jsonData["city"] = city;
    jsonData["district"] = district;
    jsonData["street"] = street;
    jsonData["streetNumber"] = streetNumber;
    jsonData["cityCode"] = cityCode;
    jsonData["adCode"] = adCode;
    jsonData["address"] = address;
    jsonData["description"] = description;
    return jsonData;
  }

  AmapLocationResult copyWith({
    String? callbackTime,
    String? locationTime,
    int? locationType,
    double? latitude,
    double? longitude,
    int? accuracy,
    int? altitude,
    int? bearing,
    int? speed,
    String? country,
    String? province,
    String? city,
    String? district,
    String? street,
    String? streetNumber,
    String? cityCode,
    String? adCode,
    String? address,
    String? description,
  }) =>
      AmapLocationResult(
        callbackTime: callbackTime ?? this.callbackTime,
        locationTime: locationTime ?? this.locationTime,
        locationType: locationType ?? this.locationType,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        accuracy: accuracy ?? this.accuracy,
        altitude: altitude ?? this.altitude,
        bearing: bearing ?? this.bearing,
        speed: speed ?? this.speed,
        country: country ?? this.country,
        province: province ?? this.province,
        city: city ?? this.city,
        district: district ?? this.district,
        street: street ?? this.street,
        streetNumber: streetNumber ?? this.streetNumber,
        cityCode: cityCode ?? this.cityCode,
        adCode: adCode ?? this.adCode,
        address: address ?? this.address,
        description: description ?? this.description,
      );
}
