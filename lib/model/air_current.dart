class AirCurrent {
  String? no2;
  String? levelIndex;
  String? tipsLong;
  String? o3;
  String? pm25;
  String? dataTime;
  String? so2;
  String? aqi;
  String? pm10;
  String? co;

  AirCurrent(
      {this.no2,
      this.levelIndex,
      this.tipsLong,
      this.o3,
      this.pm25,
      this.dataTime,
      this.so2,
      this.aqi,
      this.pm10,
      this.co});

  AirCurrent.fromJson(Map<String, dynamic> json) {
    if (json["NO2"] is String) {
      no2 = json["NO2"];
    }
    if (json["levelIndex"] is String) {
      levelIndex = json["levelIndex"];
    }
    if (json["tips_long"] is String) {
      tipsLong = json["tips_long"];
    }
    if (json["o3"] is String) {
      o3 = json["o3"];
    }
    if (json["PM25"] is String) {
      pm25 = json["PM25"];
    }
    if (json["dataTime"] is String) {
      dataTime = json["dataTime"];
    }
    if (json["SO2"] is String) {
      so2 = json["SO2"];
    }
    if (json["AQI"] is String) {
      aqi = json["AQI"];
    }
    if (json["PM10"] is String) {
      pm10 = json["PM10"];
    }
    if (json["CO"] is String) {
      co = json["CO"];
    }
  }

  static List<AirCurrent> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AirCurrent.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData["NO2"] = no2;
    jsonData["levelIndex"] = levelIndex;
    jsonData["tips_long"] = tipsLong;
    jsonData["o3"] = o3;
    jsonData["PM25"] = pm25;
    jsonData["dataTime"] = dataTime;
    jsonData["SO2"] = so2;
    jsonData["AQI"] = aqi;
    jsonData["PM10"] = pm10;
    jsonData["CO"] = co;
    return jsonData;
  }

  AirCurrent copyWith({
    String? no2,
    String? levelIndex,
    String? tipsLong,
    String? o3,
    String? pm25,
    String? dataTime,
    String? so2,
    String? aqi,
    String? pm10,
    String? co,
  }) =>
      AirCurrent(
        no2: no2 ?? this.no2,
        levelIndex: levelIndex ?? this.levelIndex,
        tipsLong: tipsLong ?? this.tipsLong,
        o3: o3 ?? this.o3,
        pm25: pm25 ?? this.pm25,
        dataTime: dataTime ?? this.dataTime,
        so2: so2 ?? this.so2,
        aqi: aqi ?? this.aqi,
        pm10: pm10 ?? this.pm10,
        co: co ?? this.co,
      );
}
