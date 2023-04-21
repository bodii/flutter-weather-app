class City {
  // 城区或乡镇id
  final String? stationid;
  // 省或直辖市
  final String? provcn;
  // 市、县
  final String? districtcn;
  // 城区或乡镇
  final String? namecn;

  @override
  City({this.stationid, this.provcn, this.districtcn, this.namecn});

  @override
  City.fromJson(Map<String, dynamic> json)
      : stationid = json['stationid'],
        provcn = json['provcn'],
        districtcn = json['districtcn'],
        namecn = json['namecn'];

  Map<String, dynamic> toJson() => {
        'stationid': stationid,
        'provcn': provcn,
        'districtcn': districtcn,
        'namecn': namecn,
      };
}
