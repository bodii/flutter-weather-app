class AmapGeoToAddress {
  String? status;
  Data? data;

  AmapGeoToAddress({this.status, this.data});

  AmapGeoToAddress.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  AmapGeoToAddress copyWith({
    String? status,
    Data? data,
  }) =>
      AmapGeoToAddress(
        status: status ?? this.status,
        data: data ?? this.data,
      );
}

class Data {
  String? code;
  String? message;
  String? result;
  String? timestamp;
  String? version;
  String? country;
  String? countrycode;
  String? province;
  String? provinceadcode;
  String? city;
  String? cityadcode;
  String? tel;
  String? areacode;
  String? district;
  String? districtadcode;
  String? adcode;
  String? desc;
  List<RoadList>? roadList;
  List<CrossList>? crossList;
  String? hn;
  SeaArea? seaArea;
  String? pos;

  Data(
      {this.code,
      this.message,
      this.result,
      this.timestamp,
      this.version,
      this.country,
      this.countrycode,
      this.province,
      this.provinceadcode,
      this.city,
      this.cityadcode,
      this.tel,
      this.areacode,
      this.district,
      this.districtadcode,
      this.adcode,
      this.desc,
      this.roadList,
      this.crossList,
      this.hn,
      this.seaArea,
      this.pos});

  Data.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    message = json["message"];
    result = json["result"];
    timestamp = json["timestamp"];
    version = json["version"];
    country = json["country"];
    countrycode = json["countrycode"];
    province = json["province"];
    provinceadcode = json["provinceadcode"];
    city = json["city"];
    cityadcode = json["cityadcode"];
    tel = json["tel"];
    areacode = json["areacode"];
    district = json["district"];
    districtadcode = json["districtadcode"];
    adcode = json["adcode"];
    desc = json["desc"];
    roadList = json["road_list"] == null
        ? null
        : (json["road_list"] as List).map((e) => RoadList.fromJson(e)).toList();
    crossList = json["cross_list"] == null
        ? null
        : (json["cross_list"] as List)
            .map((e) => CrossList.fromJson(e))
            .toList();
    hn = json["hn"];
    seaArea =
        json["sea_area"] == null ? null : SeaArea.fromJson(json["sea_area"]);
    pos = json["pos"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    _data["result"] = result;
    _data["timestamp"] = timestamp;
    _data["version"] = version;
    _data["country"] = country;
    _data["countrycode"] = countrycode;
    _data["province"] = province;
    _data["provinceadcode"] = provinceadcode;
    _data["city"] = city;
    _data["cityadcode"] = cityadcode;
    _data["tel"] = tel;
    _data["areacode"] = areacode;
    _data["district"] = district;
    _data["districtadcode"] = districtadcode;
    _data["adcode"] = adcode;
    _data["desc"] = desc;
    if (roadList != null) {
      _data["road_list"] = roadList?.map((e) => e.toJson()).toList();
    }
    if (crossList != null) {
      _data["cross_list"] = crossList?.map((e) => e.toJson()).toList();
    }
    _data["hn"] = hn;
    if (seaArea != null) {
      _data["sea_area"] = seaArea?.toJson();
    }
    _data["pos"] = pos;
    return _data;
  }

  Data copyWith({
    String? code,
    String? message,
    String? result,
    String? timestamp,
    String? version,
    String? country,
    String? countrycode,
    String? province,
    String? provinceadcode,
    String? city,
    String? cityadcode,
    String? tel,
    String? areacode,
    String? district,
    String? districtadcode,
    String? adcode,
    String? desc,
    List<RoadList>? roadList,
    List<CrossList>? crossList,
    String? hn,
    SeaArea? seaArea,
    String? pos,
  }) =>
      Data(
        code: code ?? this.code,
        message: message ?? this.message,
        result: result ?? this.result,
        timestamp: timestamp ?? this.timestamp,
        version: version ?? this.version,
        country: country ?? this.country,
        countrycode: countrycode ?? this.countrycode,
        province: province ?? this.province,
        provinceadcode: provinceadcode ?? this.provinceadcode,
        city: city ?? this.city,
        cityadcode: cityadcode ?? this.cityadcode,
        tel: tel ?? this.tel,
        areacode: areacode ?? this.areacode,
        district: district ?? this.district,
        districtadcode: districtadcode ?? this.districtadcode,
        adcode: adcode ?? this.adcode,
        desc: desc ?? this.desc,
        roadList: roadList ?? this.roadList,
        crossList: crossList ?? this.crossList,
        hn: hn ?? this.hn,
        seaArea: seaArea ?? this.seaArea,
        pos: pos ?? this.pos,
      );
}

class SeaArea {
  String? adcode;
  String? name;

  SeaArea({this.adcode, this.name});

  SeaArea.fromJson(Map<String, dynamic> json) {
    adcode = json["adcode"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["adcode"] = adcode;
    _data["name"] = name;
    return _data;
  }

  SeaArea copyWith({
    String? adcode,
    String? name,
  }) =>
      SeaArea(
        adcode: adcode ?? this.adcode,
        name: name ?? this.name,
      );
}

class CrossList {
  String? crossid;
  String? direction;
  String? distance;
  String? latitude;
  String? level;
  String? longitude;
  String? name;
  String? weight;
  String? width;

  CrossList(
      {this.crossid,
      this.direction,
      this.distance,
      this.latitude,
      this.level,
      this.longitude,
      this.name,
      this.weight,
      this.width});

  CrossList.fromJson(Map<String, dynamic> json) {
    crossid = json["crossid"];
    direction = json["direction"];
    distance = json["distance"];
    latitude = json["latitude"];
    level = json["level"];
    longitude = json["longitude"];
    name = json["name"];
    weight = json["weight"];
    width = json["width"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["crossid"] = crossid;
    _data["direction"] = direction;
    _data["distance"] = distance;
    _data["latitude"] = latitude;
    _data["level"] = level;
    _data["longitude"] = longitude;
    _data["name"] = name;
    _data["weight"] = weight;
    _data["width"] = width;
    return _data;
  }

  CrossList copyWith({
    String? crossid,
    String? direction,
    String? distance,
    String? latitude,
    String? level,
    String? longitude,
    String? name,
    String? weight,
    String? width,
  }) =>
      CrossList(
        crossid: crossid ?? this.crossid,
        direction: direction ?? this.direction,
        distance: distance ?? this.distance,
        latitude: latitude ?? this.latitude,
        level: level ?? this.level,
        longitude: longitude ?? this.longitude,
        name: name ?? this.name,
        weight: weight ?? this.weight,
        width: width ?? this.width,
      );
}

class RoadList {
  String? direction;
  String? distance;
  String? latitude;
  String? level;
  String? longitude;
  String? name;
  String? roadid;
  String? width;

  RoadList(
      {this.direction,
      this.distance,
      this.latitude,
      this.level,
      this.longitude,
      this.name,
      this.roadid,
      this.width});

  RoadList.fromJson(Map<String, dynamic> json) {
    direction = json["direction"];
    distance = json["distance"];
    latitude = json["latitude"];
    level = json["level"];
    longitude = json["longitude"];
    name = json["name"];
    roadid = json["roadid"];
    width = json["width"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["direction"] = direction;
    _data["distance"] = distance;
    _data["latitude"] = latitude;
    _data["level"] = level;
    _data["longitude"] = longitude;
    _data["name"] = name;
    _data["roadid"] = roadid;
    _data["width"] = width;
    return _data;
  }

  RoadList copyWith({
    String? direction,
    String? distance,
    String? latitude,
    String? level,
    String? longitude,
    String? name,
    String? roadid,
    String? width,
  }) =>
      RoadList(
        direction: direction ?? this.direction,
        distance: distance ?? this.distance,
        latitude: latitude ?? this.latitude,
        level: level ?? this.level,
        longitude: longitude ?? this.longitude,
        name: name ?? this.name,
        roadid: roadid ?? this.roadid,
        width: width ?? this.width,
      );
}
