class WniHotCountryList {
  late final List<WniHotCountry> list;

  WniHotCountryList({required this.list});

  WniHotCountryList.fromJson(List<dynamic> json) {
    list = json.map((e) => WniHotCountry.fromJson(e)).toList();
  }

  List<Map<String, dynamic>>? toJson() {
    return list.map((e) => e.toJson()).toList();
  }

  WniHotCountryList copyWith({
    List<WniHotCountry>? list,
  }) =>
      WniHotCountryList(
        list: list ?? this.list,
      );
}

class WniHotCountry {
  List<Data>? data;
  String? typeNum;
  String? type;

  WniHotCountry({this.data, this.typeNum, this.type});

  WniHotCountry.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if (json["typeNum"] is String) {
      typeNum = json["typeNum"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  static List<WniHotCountry> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => WniHotCountry.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["typeNum"] = typeNum;
    _data["type"] = type;
    return _data;
  }

  WniHotCountry copyWith({
    List<Data>? data,
    String? typeNum,
    String? type,
  }) =>
      WniHotCountry(
        data: data ?? this.data,
        typeNum: typeNum ?? this.typeNum,
        type: type ?? this.type,
      );
}

class Data {
  String? isparam;
  List<Data1>? data;

  Data({this.isparam, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["isparam"] is String) {
      isparam = json["isparam"];
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data1.fromJson(e)).toList();
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isparam"] = isparam;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Data copyWith({
    String? isparam,
    List<Data1>? data,
  }) =>
      Data(
        isparam: isparam ?? this.isparam,
        data: data ?? this.data,
      );
}

class Data1 {
  String? isparam;
  String? country;
  String? continentCn;
  String? countryname;
  String? sdcn;
  String? countrycn;
  String? sddataid;
  String? sden;

  Data1(
      {this.isparam,
      this.country,
      this.continentCn,
      this.countryname,
      this.sdcn,
      this.countrycn,
      this.sddataid,
      this.sden});

  Data1.fromJson(Map<String, dynamic> json) {
    if (json["isparam"] is String) {
      isparam = json["isparam"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["continent_cn"] is String) {
      continentCn = json["continent_cn"];
    }
    if (json["countryname"] is String) {
      countryname = json["countryname"];
    }
    if (json["sdcn"] is String) {
      sdcn = json["sdcn"];
    }
    if (json["countrycn"] is String) {
      countrycn = json["countrycn"];
    }
    if (json["sddataid"] is String) {
      sddataid = json["sddataid"];
    }
    if (json["sden"] is String) {
      sden = json["sden"];
    }
  }

  static List<Data1> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data1.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isparam"] = isparam;
    _data["country"] = country;
    _data["continent_cn"] = continentCn;
    _data["countryname"] = countryname;
    _data["sdcn"] = sdcn;
    _data["countrycn"] = countrycn;
    _data["sddataid"] = sddataid;
    _data["sden"] = sden;
    return _data;
  }

  Data1 copyWith({
    String? isparam,
    String? country,
    String? continentCn,
    String? countryname,
    String? sdcn,
    String? countrycn,
    String? sddataid,
    String? sden,
  }) =>
      Data1(
        isparam: isparam ?? this.isparam,
        country: country ?? this.country,
        continentCn: continentCn ?? this.continentCn,
        countryname: countryname ?? this.countryname,
        sdcn: sdcn ?? this.sdcn,
        countrycn: countrycn ?? this.countrycn,
        sddataid: sddataid ?? this.sddataid,
        sden: sden ?? this.sden,
      );
}
