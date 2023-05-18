class AirForecast {
  String? min;
  String? data;
  String? max;

  AirForecast({this.min, this.data, this.max});

  AirForecast.fromJson(Map<String, dynamic> json) {
    if (json["min"] is String) {
      min = json["min"];
    }
    if (json["data"] is String) {
      data = json["data"];
    }
    if (json["max"] is String) {
      max = json["max"];
    }
  }

  static List<AirForecast> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => AirForecast.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData["min"] = min;
    jsonData["data"] = data;
    jsonData["max"] = max;
    return jsonData;
  }

  AirForecast copyWith({
    String? min,
    String? data,
    String? max,
  }) =>
      AirForecast(
        min: min ?? this.min,
        data: data ?? this.data,
        max: max ?? this.max,
      );
}
