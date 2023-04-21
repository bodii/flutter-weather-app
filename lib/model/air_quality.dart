class AirQuality {
  String? levelIndex;
  String? districtcn;
  String? aQI;
  String? namecn;
  String? provcn;

  AirQuality({
    this.levelIndex,
    this.districtcn,
    this.aQI,
    this.namecn,
    this.provcn,
  });

  AirQuality.fromJson(Map<String, dynamic> json) {
    levelIndex = json['levelIndex'];
    districtcn = json['districtcn'];
    aQI = json['AQI'];
    namecn = json['namecn'];
    provcn = json['provcn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['levelIndex'] = levelIndex;
    data['districtcn'] = districtcn;
    data['AQI'] = aQI;
    data['namecn'] = namecn;
    data['provcn'] = provcn;
    return data;
  }
}
