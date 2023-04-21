class RelatedWeather {
  List<RelateJc>? relateJc;
  List<RelatedArea>? relatedArea;
  List<Related3Ajq>? related3Ajq;

  RelatedWeather({this.relateJc, this.relatedArea, this.related3Ajq});

  RelatedWeather.fromJson(Map<String, dynamic> json) {
    if (json['relateJc'] != null) {
      relateJc = <RelateJc>[];
      json['relateJc'].forEach((v) {
        relateJc!.add(RelateJc.fromJson(v));
      });
    }
    if (json['relatedArea'] != null) {
      relatedArea = <RelatedArea>[];
      json['relatedArea'].forEach((v) {
        relatedArea!.add(RelatedArea.fromJson(v));
      });
    }
    if (json['related3Ajq'] != null) {
      related3Ajq = [];
      json['related3Ajq'].forEach((v) {
        related3Ajq!.add(Related3Ajq.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (relateJc != null) {
      data['relateJc'] = relateJc!.map((v) => v.toJson()).toList();
    }
    if (relatedArea != null) {
      data['relatedArea'] = relatedArea!.map((v) => v.toJson()).toList();
    }
    if (related3Ajq != null) {
      data['related3Ajq'] = related3Ajq!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelateJc {
  String? temperatureAm;
  String? winddirAm;
  String? areaid;
  String? namecn;
  String? id;
  String? weatherAmPic;
  String? weatherPm;
  String? weatherIndexPm;
  String? temperaturePm;
  String? weatherIndexAm;

  RelateJc(
      {this.temperatureAm,
      this.winddirAm,
      this.areaid,
      this.namecn,
      this.id,
      this.weatherAmPic,
      this.weatherPm,
      this.weatherIndexPm,
      this.temperaturePm,
      this.weatherIndexAm});

  RelateJc.fromJson(Map<String, dynamic> json) {
    temperatureAm = json['temperature_am'];
    winddirAm = json['winddir_am'];
    areaid = json['areaid'];
    namecn = json['namecn'];
    id = json['id'];
    weatherAmPic = json['weather_am_pic'];
    weatherPm = json['weather_pm'];
    weatherIndexPm = json['weather_index_pm'];
    temperaturePm = json['temperature_pm'];
    weatherIndexAm = json['weather_index_am'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['temperature_am'] = temperatureAm;
    data['winddir_am'] = winddirAm;
    data['areaid'] = areaid;
    data['namecn'] = namecn;
    data['id'] = id;
    data['weather_am_pic'] = weatherAmPic;
    data['weather_pm'] = weatherPm;
    data['weather_index_pm'] = weatherIndexPm;
    data['temperature_pm'] = temperaturePm;
    data['weather_index_am'] = weatherIndexAm;
    return data;
  }
}

class RelatedArea {
  String? temperatureAm;
  String? winddirAm;
  String? namecn;
  String? id;
  String? weatherAmPic;
  String? weatherPm;
  String? weatherIndexPm;
  String? temperaturePm;
  String? weatherIndexAm;

  RelatedArea(
      {this.temperatureAm,
      this.winddirAm,
      this.namecn,
      this.id,
      this.weatherAmPic,
      this.weatherPm,
      this.weatherIndexPm,
      this.temperaturePm,
      this.weatherIndexAm});

  RelatedArea.fromJson(Map<String, dynamic> json) {
    temperatureAm = json['temperature_am'];
    winddirAm = json['winddir_am'];
    namecn = json['namecn'];
    id = json['id'];
    weatherAmPic = json['weather_am_pic'];
    weatherPm = json['weather_pm'];
    weatherIndexPm = json['weather_index_pm'];
    temperaturePm = json['temperature_pm'];
    weatherIndexAm = json['weather_index_am'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['temperature_am'] = temperatureAm;
    data['winddir_am'] = winddirAm;
    data['namecn'] = namecn;
    data['id'] = id;
    data['weather_am_pic'] = weatherAmPic;
    data['weather_pm'] = weatherPm;
    data['weather_index_pm'] = weatherIndexPm;
    data['temperature_pm'] = temperaturePm;
    data['weather_index_am'] = weatherIndexAm;
    return data;
  }
}

class Related3Ajq {
  String? temperatureAm;
  String? winddirAm;
  String? areaid;
  String? namecn;
  String? id;
  String? weatherAmPic;
  String? weatherPm;
  String? weatherIndexPm;
  String? temperaturePm;
  String? weatherIndexAm;

  Related3Ajq(
      {this.temperatureAm,
      this.winddirAm,
      this.areaid,
      this.namecn,
      this.id,
      this.weatherAmPic,
      this.weatherPm,
      this.weatherIndexPm,
      this.temperaturePm,
      this.weatherIndexAm});

  Related3Ajq.fromJson(Map<String, dynamic> json) {
    temperatureAm = json['temperature_am'];
    winddirAm = json['winddir_am'];
    areaid = json['areaid'];
    namecn = json['namecn'];
    id = json['id'];
    weatherAmPic = json['weather_am_pic'];
    weatherPm = json['weather_pm'];
    weatherIndexPm = json['weather_index_pm'];
    temperaturePm = json['temperature_pm'];
    weatherIndexAm = json['weather_index_am'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['temperature_am'] = temperatureAm;
    data['winddir_am'] = winddirAm;
    data['areaid'] = areaid;
    data['namecn'] = namecn;
    data['id'] = id;
    data['weather_am_pic'] = weatherAmPic;
    data['weather_pm'] = weatherPm;
    data['weather_index_pm'] = weatherIndexPm;
    data['temperature_pm'] = temperaturePm;
    data['weather_index_am'] = weatherIndexAm;
    return data;
  }
}
