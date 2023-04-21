class CityInfo {
  String? districtcn;
  String? lng;
  String? namecn;
  String? id;
  String? provcn;
  String? lat;

  CityInfo({
    this.districtcn,
    this.lng,
    this.namecn,
    this.id,
    this.provcn,
    this.lat,
  });

  CityInfo.fromJson(Map<String, dynamic> json) {
    districtcn = json['districtcn'];
    lng = json['lng'];
    namecn = json['namecn'];
    id = json['id'];
    provcn = json['provcn'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['districtcn'] = districtcn;
    data['lng'] = lng;
    data['namecn'] = namecn;
    data['id'] = id;
    data['provcn'] = provcn;
    data['lat'] = lat;
    return data;
  }
}
