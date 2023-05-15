class AmapGeoToAddress {
  String? status;
  Data? data;

  AmapGeoToAddress({this.status, this.data});

  AmapGeoToAddress.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap["status"] = status;
    dataMap["data"] = data?.toJson();
    return dataMap;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    data["result"] = result;
    data["timestamp"] = timestamp;
    data["version"] = version;
    data["country"] = country;
    data["countrycode"] = countrycode;
    data["province"] = province;
    data["provinceadcode"] = provinceadcode;
    data["city"] = city;
    data["cityadcode"] = cityadcode;
    data["tel"] = tel;
    data["areacode"] = areacode;
    data["district"] = district;
    data["districtadcode"] = districtadcode;
    data["adcode"] = adcode;
    data["desc"] = desc;
    if (roadList != null) {
      data["road_list"] = roadList?.map((e) => e.toJson()).toList();
    }
    if (crossList != null) {
      data["cross_list"] = crossList?.map((e) => e.toJson()).toList();
    }
    data["hn"] = hn;
    if (seaArea != null) {
      data["sea_area"] = seaArea?.toJson();
    }
    data["pos"] = pos;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adcode"] = adcode;
    data["name"] = name;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["crossid"] = crossid;
    data["direction"] = direction;
    data["distance"] = distance;
    data["latitude"] = latitude;
    data["level"] = level;
    data["longitude"] = longitude;
    data["name"] = name;
    data["weight"] = weight;
    data["width"] = width;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["direction"] = direction;
    data["distance"] = distance;
    data["latitude"] = latitude;
    data["level"] = level;
    data["longitude"] = longitude;
    data["name"] = name;
    data["roadid"] = roadid;
    data["width"] = width;
    return data;
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
