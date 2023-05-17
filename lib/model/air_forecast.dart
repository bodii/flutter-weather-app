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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["min"] = min;
    _data["data"] = data;
    _data["max"] = max;
    return _data;
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
