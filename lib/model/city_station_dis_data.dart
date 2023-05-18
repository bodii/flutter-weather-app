class CityStationDisDataList {
  List<CityStationDis>? cityStationDisList;

  CityStationDisDataList({this.cityStationDisList});

  CityStationDisDataList.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      cityStationDisList = json
          .map((e) => CityStationDis.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  static List<CityStationDis> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CityStationDis.fromJson(map)).toList();
  }

  List<Map<String, dynamic>> toJson() {
    final List<Map<String, dynamic>> data = <Map<String, dynamic>>[];
    if (cityStationDisList!.length > 1) {
      for (CityStationDis cityStationDis in cityStationDisList!) {
        data.add(cityStationDis.toJson());
      }
    }
    return data;
  }

  CityStationDisDataList copyWith({
    List<CityStationDis>? cityStationDisList,
  }) =>
      CityStationDisDataList(
        cityStationDisList: cityStationDisList ?? this.cityStationDisList,
      );
}

class CityStationDis {
  String? districtcn;
  String? namecn;
  String? provcn;
  String? stationid;

  CityStationDis({this.districtcn, this.namecn, this.provcn, this.stationid});

  CityStationDis.fromJson(Map<String, dynamic> json) {
    if (json["districtcn"] is String) {
      districtcn = json["districtcn"];
    }
    if (json["namecn"] is String) {
      namecn = json["namecn"];
    }
    if (json["provcn"] is String) {
      provcn = json["provcn"];
    }
    if (json["stationid"] is String) {
      stationid = json["stationid"];
    }
  }

  static List<CityStationDis> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CityStationDis.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData["districtcn"] = districtcn;
    jsonData["namecn"] = namecn;
    jsonData["provcn"] = provcn;
    jsonData["stationid"] = stationid;
    return jsonData;
  }

  CityStationDis copyWith({
    String? districtcn,
    String? namecn,
    String? provcn,
    String? stationid,
  }) =>
      CityStationDis(
        districtcn: districtcn ?? this.districtcn,
        namecn: namecn ?? this.namecn,
        provcn: provcn ?? this.provcn,
        stationid: stationid ?? this.stationid,
      );
}
