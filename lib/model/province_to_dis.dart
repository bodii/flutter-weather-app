class ProvinceToDis {
  String? districtcn;
  String? namecn;
  String? provcn;
  String? stationid;

  ProvinceToDis({
    this.districtcn,
    this.namecn,
    this.provcn,
    this.stationid,
  });

  ProvinceToDis.fromJson(Map<String, dynamic> json) {
    districtcn = json['districtcn'];
    namecn = json['namecn'];
    provcn = json['provcn'];
    stationid = json['stationid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['districtcn'] = districtcn;
    data['namecn'] = namecn;
    data['provcn'] = provcn;
    data['stationid'] = stationid;
    return data;
  }
}
