class Area {
  // 省或直辖市
  String? province;
  // 包含的城市列表
  List<CityList>? cityList;

  Area({this.province, this.cityList});

  Area.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    if (json['cityList'] != null) {
      cityList = <CityList>[];
      json['cityList'].forEach((v) {
        cityList!.add(CityList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['province'] = province;
    if (cityList != null) {
      data['cityList'] = cityList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityList {
  // 市、县
  String? city;
  // 城区或乡镇
  List<DisList>? disList;

  CityList({this.city, this.disList});

  CityList.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    if (json['disList'] != null) {
      disList = <DisList>[];
      json['disList'].forEach((v) {
        disList!.add(DisList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (disList != null) {
      data['disList'] = disList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DisList {
  // 城区或乡镇
  String? district;
  // 城区或乡镇id
  String? stationid;

  DisList({this.district, this.stationid});

  DisList.fromJson(Map<String, dynamic> json) {
    district = json['district'];
    stationid = json['stationid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['district'] = district;
    data['stationid'] = stationid;
    return data;
  }
}
