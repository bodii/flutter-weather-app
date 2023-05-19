class WniHotCity {
  String? name;
  String? id;

  WniHotCity({this.name, this.id});

  WniHotCity.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["id"] = id;
    return data;
  }

  WniHotCity copyWith({
    String? name,
    String? id,
  }) =>
      WniHotCity(
        name: name ?? this.name,
        id: id ?? this.id,
      );
}

class WniHotCityList {
  late final List<WniHotCity>? wniHotCityList;

  WniHotCityList({this.wniHotCityList});

  WniHotCityList.fromJson(List<dynamic> json) {
    List<WniHotCity> wniList = [];
    for (var wni in json) {
      wniList.add(WniHotCity.fromJson(wni as Map<String, dynamic>));
    }

    wniHotCityList = wniList;
  }

  List<Map<String, dynamic>> toJson() {
    final List<Map<String, dynamic>> data = <Map<String, dynamic>>[];
    for (WniHotCity wni in wniHotCityList!) {
      data.add(wni.toJson());
    }
    return data;
  }

  WniHotCity? find(String name) {
    for (WniHotCity wni in wniHotCityList!) {
      if (wni.name == name) {
        return wni;
      }
    }

    return null;
  }

  WniHotCityList copyWith({
    List<WniHotCity>? wniHotCityList,
  }) =>
      WniHotCityList(
        wniHotCityList: wniHotCityList ?? this.wniHotCityList,
      );
}

class WniHotCityNameId {
  late final Map<String, String>? nameIds;

  WniHotCityNameId({this.nameIds});

  Map<String, String>? toJson() {
    return nameIds;
  }

  WniHotCityNameId.fromJson(WniHotCityList list) {
    Map<String, String> data = {};
    for (WniHotCity wni in list.wniHotCityList!) {
      data[wni.name!] = wni.id!;
    }

    nameIds = data;
  }

  WniHotCityNameId copyWith({
    Map<String, String>? nameIds,
  }) =>
      WniHotCityNameId(
        nameIds: nameIds ?? this.nameIds,
      );
}
