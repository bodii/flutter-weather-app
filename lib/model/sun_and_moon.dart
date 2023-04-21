class SunAndMoonAndIndex {
  SunAndMoon? sunAndMoon;
  List<Index>? index;

  SunAndMoonAndIndex({this.sunAndMoon, this.index});

  SunAndMoonAndIndex.fromJson(Map<String, dynamic> json) {
    sunAndMoon = json['sunAndMoon'] != null
        ? SunAndMoon.fromJson(json['sunAndMoon'])
        : null;
    if (json['index'] != null) {
      index = <Index>[];
      json['index'].forEach((v) {
        index!.add(Index.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (sunAndMoon != null) {
      data['sunAndMoon'] = sunAndMoon!.toJson();
    }
    if (index != null) {
      data['index'] = index!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SunAndMoon {
  Moon? moon;
  Sun? sun;

  SunAndMoon({this.moon, this.sun});

  SunAndMoon.fromJson(Map<String, dynamic> json) {
    moon = json['moon'] != null ? Moon.fromJson(json['moon']) : null;
    sun = json['sun'] != null ? Sun.fromJson(json['sun']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (moon != null) {
      data['moon'] = moon!.toJson();
    }
    if (sun != null) {
      data['sun'] = sun!.toJson();
    }
    return data;
  }
}

class Moon {
  String? moonrise;
  String? moonset;
  String? moonage;

  Moon({this.moonrise, this.moonset, this.moonage});

  Moon.fromJson(Map<String, dynamic> json) {
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonage = json['moonage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moonage'] = moonage;
    return data;
  }
}

class Sun {
  String? sunrise;
  String? sunset;

  Sun({this.sunrise, this.sunset});

  Sun.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class Index {
  String? indexLevel;
  String? indexContent;
  String? indexTypeCh;

  Index({this.indexLevel, this.indexContent, this.indexTypeCh});

  Index.fromJson(Map<String, dynamic> json) {
    indexLevel = json['index_level'];
    indexContent = json['index_content'];
    indexTypeCh = json['index_type_ch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['index_level'] = indexLevel;
    data['index_content'] = indexContent;
    data['index_type_ch'] = indexTypeCh;
    return data;
  }
}
