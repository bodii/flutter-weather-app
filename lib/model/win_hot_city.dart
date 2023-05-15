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
