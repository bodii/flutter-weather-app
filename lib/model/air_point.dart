class AirPoint {
  String? area;
  String? aqiLevel;
  String? pm25Level;
  String? so2LevelColor;
  String? pm10Level;
  String? pm10;
  String? coLevelColor;
  String? no2Level;
  String? lon;
  String? no2LevelColor;
  String? aqiLevelColor;
  String? pm10LevelColor;
  String? so2Level;
  String? no2;
  String? pm25;
  String? coLevel;
  String? so2;
  String? aqi;
  String? lat;
  String? pm25LevelColor;
  String? co;

  AirPoint(
      {this.area,
      this.aqiLevel,
      this.pm25Level,
      this.so2LevelColor,
      this.pm10Level,
      this.pm10,
      this.coLevelColor,
      this.no2Level,
      this.lon,
      this.no2LevelColor,
      this.aqiLevelColor,
      this.pm10LevelColor,
      this.so2Level,
      this.no2,
      this.pm25,
      this.coLevel,
      this.so2,
      this.aqi,
      this.lat,
      this.pm25LevelColor,
      this.co});

  AirPoint.fromJson(Map<String, dynamic> json) {
    if (json["area"] is String) {
      area = json["area"];
    }
    if (json["aqi_level"] is String) {
      aqiLevel = json["aqi_level"];
    }
    if (json["pm25_level"] is String) {
      pm25Level = json["pm25_level"];
    }
    if (json["so2_level_color"] is String) {
      so2LevelColor = json["so2_level_color"];
    }
    if (json["pm10_level"] is String) {
      pm10Level = json["pm10_level"];
    }
    if (json["pm10"] is String) {
      pm10 = json["pm10"];
    }
    if (json["co_level_color"] is String) {
      coLevelColor = json["co_level_color"];
    }
    if (json["no2_level"] is String) {
      no2Level = json["no2_level"];
    }
    if (json["lon"] is String) {
      lon = json["lon"];
    }
    if (json["no2_level_color"] is String) {
      no2LevelColor = json["no2_level_color"];
    }
    if (json["aqi_level_color"] is String) {
      aqiLevelColor = json["aqi_level_color"];
    }
    if (json["pm10_level_color"] is String) {
      pm10LevelColor = json["pm10_level_color"];
    }
    if (json["so2_level"] is String) {
      so2Level = json["so2_level"];
    }
    if (json["no2"] is String) {
      no2 = json["no2"];
    }
    if (json["pm25"] is String) {
      pm25 = json["pm25"];
    }
    if (json["co_level"] is String) {
      coLevel = json["co_level"];
    }
    if (json["so2"] is String) {
      so2 = json["so2"];
    }
    if (json["aqi"] is String) {
      aqi = json["aqi"];
    }
    if (json["lat"] is String) {
      lat = json["lat"];
    }
    if (json["pm25_level_color"] is String) {
      pm25LevelColor = json["pm25_level_color"];
    }
    if (json["co"] is String) {
      co = json["co"];
    }
  }

  static List<AirPoint> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AirPoint.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["area"] = area;
    data["aqi_level"] = aqiLevel;
    data["pm25_level"] = pm25Level;
    data["so2_level_color"] = so2LevelColor;
    data["pm10_level"] = pm10Level;
    data["pm10"] = pm10;
    data["co_level_color"] = coLevelColor;
    data["no2_level"] = no2Level;
    data["lon"] = lon;
    data["no2_level_color"] = no2LevelColor;
    data["aqi_level_color"] = aqiLevelColor;
    data["pm10_level_color"] = pm10LevelColor;
    data["so2_level"] = so2Level;
    data["no2"] = no2;
    data["pm25"] = pm25;
    data["co_level"] = coLevel;
    data["so2"] = so2;
    data["aqi"] = aqi;
    data["lat"] = lat;
    data["pm25_level_color"] = pm25LevelColor;
    data["co"] = co;
    return data;
  }

  AirPoint copyWith({
    String? area,
    String? aqiLevel,
    String? pm25Level,
    String? so2LevelColor,
    String? pm10Level,
    String? pm10,
    String? coLevelColor,
    String? no2Level,
    String? lon,
    String? no2LevelColor,
    String? aqiLevelColor,
    String? pm10LevelColor,
    String? so2Level,
    String? no2,
    String? pm25,
    String? coLevel,
    String? so2,
    String? aqi,
    String? lat,
    String? pm25LevelColor,
    String? co,
  }) =>
      AirPoint(
        area: area ?? this.area,
        aqiLevel: aqiLevel ?? this.aqiLevel,
        pm25Level: pm25Level ?? this.pm25Level,
        so2LevelColor: so2LevelColor ?? this.so2LevelColor,
        pm10Level: pm10Level ?? this.pm10Level,
        pm10: pm10 ?? this.pm10,
        coLevelColor: coLevelColor ?? this.coLevelColor,
        no2Level: no2Level ?? this.no2Level,
        lon: lon ?? this.lon,
        no2LevelColor: no2LevelColor ?? this.no2LevelColor,
        aqiLevelColor: aqiLevelColor ?? this.aqiLevelColor,
        pm10LevelColor: pm10LevelColor ?? this.pm10LevelColor,
        so2Level: so2Level ?? this.so2Level,
        no2: no2 ?? this.no2,
        pm25: pm25 ?? this.pm25,
        coLevel: coLevel ?? this.coLevel,
        so2: so2 ?? this.so2,
        aqi: aqi ?? this.aqi,
        lat: lat ?? this.lat,
        pm25LevelColor: pm25LevelColor ?? this.pm25LevelColor,
        co: co ?? this.co,
      );
}
