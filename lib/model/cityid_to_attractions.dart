class CityidToAttractions {
  String? areaid;
  String? jqid;
  String? lng;
  String? lat;
  String? scenicspotname;

  CityidToAttractions(
      {this.areaid, this.jqid, this.lng, this.lat, this.scenicspotname});

  CityidToAttractions.fromJson(Map<String, dynamic> json) {
    areaid = json['areaid'];
    jqid = json['jqid'];
    lng = json['lng'];
    lat = json['lat'];
    scenicspotname = json['scenicspotname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['areaid'] = areaid;
    data['jqid'] = jqid;
    data['lng'] = lng;
    data['lat'] = lat;
    data['scenicspotname'] = scenicspotname;
    return data;
  }
}
