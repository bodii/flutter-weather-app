class WniHotCountryObsCapl {
  String? iconDecoder;
  String? temp;
  String? id;
  String? iconPic;

  WniHotCountryObsCapl({this.iconDecoder, this.temp, this.id, this.iconPic});

  WniHotCountryObsCapl.fromJson(Map<String, dynamic> json) {
    iconDecoder = json["iconDecoder"];
    temp = json["temp"];
    id = json["id"];
    iconPic = json["iconPic"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["iconDecoder"] = iconDecoder;
    data["temp"] = temp;
    data["id"] = id;
    data["iconPic"] = iconPic;
    return data;
  }

  WniHotCountryObsCapl copyWith({
    String? iconDecoder,
    String? temp,
    String? id,
    String? iconPic,
  }) =>
      WniHotCountryObsCapl(
        iconDecoder: iconDecoder ?? this.iconDecoder,
        temp: temp ?? this.temp,
        id: id ?? this.id,
        iconPic: iconPic ?? this.iconPic,
      );
}
