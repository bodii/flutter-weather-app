class Weather {
  CurrentWeather? current;
  List<Forecast15d>? forecast15d;
  List<Forecast24h>? forecast24h;

  Weather({this.current, this.forecast15d, this.forecast24h});

  Weather.fromJson(Map<String, dynamic> json) {
    current = json['current'] != null
        ? CurrentWeather.fromJson(json['current'])
        : null;
    if (json['forecast15d'] != null) {
      forecast15d = [];
      json['forecast15d'].forEach((v) {
        forecast15d!.add(Forecast15d.fromJson(v));
      });
    }
    if (json['forecast24h'] != null) {
      forecast24h = [];
      json['forecast24h'].forEach((v) {
        forecast24h!.add(Forecast24h.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast15d != null) {
      data['forecast15d'] = forecast15d!.map((v) => v.toJson()).toList();
    }
    if (forecast24h != null) {
      data['forecast24h'] = forecast24h!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentWeather {
  List? alerts;
  Current? current;
  String? nongLi;
  Air? air;
  String? tips;

  CurrentWeather({this.alerts, this.current, this.nongLi, this.air, this.tips});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    if (json['alerts'] != null) {
      alerts = <Null>[];
      json['alerts'].forEach((v) {
        alerts!.add(null);
      });
    }
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    nongLi = json['nongLi'];
    air = json['air'] != null ? Air.fromJson(json['air']) : null;
    tips = json['tips'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (alerts != null) {
      data['alerts'] = alerts!.map((v) => v.toJson()).toList();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    data['nongLi'] = nongLi;
    if (air != null) {
      data['air'] = air!.toJson();
    }
    data['tips'] = tips;
    return data;
  }
}

class Current {
  String? airpressure;
  String? weatherPic;
  String? visibility;
  String? windpower;
  String? feelstemperature;
  String? temperature;
  String? weather;
  String? humidity;
  String? weatherIndex;
  String? winddir;
  String? reporttime;

  Current(
      {airpressure,
      weatherPic,
      visibility,
      windpower,
      feelstemperature,
      temperature,
      weather,
      humidity,
      weatherIndex,
      winddir,
      reporttime});

  Current.fromJson(Map<String, dynamic> json) {
    airpressure = json['airpressure'];
    weatherPic = json['weatherPic'];
    visibility = json['visibility'];
    windpower = json['windpower'];
    feelstemperature = json['feelstemperature'];
    temperature = json['temperature'];
    weather = json['weather'];
    humidity = json['humidity'];
    weatherIndex = json['weatherIndex'];
    winddir = json['winddir'];
    reporttime = json['reporttime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['airpressure'] = airpressure;
    data['weatherPic'] = weatherPic;
    data['visibility'] = visibility;
    data['windpower'] = windpower;
    data['feelstemperature'] = feelstemperature;
    data['temperature'] = temperature;
    data['weather'] = weather;
    data['humidity'] = humidity;
    data['weatherIndex'] = weatherIndex;
    data['winddir'] = winddir;
    data['reporttime'] = reporttime;
    return data;
  }
}

class Air {
  String? levelIndex;
  String? aQI;

  Air({levelIndex, this.aQI});

  Air.fromJson(Map<String, dynamic> json) {
    levelIndex = json['levelIndex'];
    aQI = json['AQI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['levelIndex'] = levelIndex;
    data['AQI'] = aQI;
    return data;
  }
}

class Forecast15d {
  String? temperatureAm;
  String? weatherPmPic;
  String? winddirAm;
  String? week;
  String? forecasttime;
  String? windpowerPm;
  String? weatherPm;
  String? reporttime;
  String? weatherIndexPm;
  String? winddirPm;
  String? weatherAm;
  String? sunriseSunset;
  String? windpowerAm;
  String? weatherAmPic;
  String? temperaturePm;
  String? weatherIndexAm;

  Forecast15d(
      {temperatureAm,
      weatherPmPic,
      winddirAm,
      week,
      forecasttime,
      windpowerPm,
      weatherPm,
      reporttime,
      weatherIndexPm,
      winddirPm,
      weatherAm,
      sunriseSunset,
      windpowerAm,
      weatherAmPic,
      temperaturePm,
      weatherIndexAm});

  Forecast15d.fromJson(Map<String, dynamic> json) {
    temperatureAm = json['temperature_am'];
    weatherPmPic = json['weather_pm_pic'];
    winddirAm = json['winddir_am'];
    week = json['week'];
    forecasttime = json['forecasttime'];
    windpowerPm = json['windpower_pm'];
    weatherPm = json['weather_pm'];
    reporttime = json['reporttime'];
    weatherIndexPm = json['weather_index_pm'];
    winddirPm = json['winddir_pm'];
    weatherAm = json['weather_am'];
    sunriseSunset = json['sunrise_sunset'];
    windpowerAm = json['windpower_am'];
    weatherAmPic = json['weather_am_pic'];
    temperaturePm = json['temperature_pm'];
    weatherIndexAm = json['weather_index_am'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['temperature_am'] = temperatureAm;
    data['weather_pm_pic'] = weatherPmPic;
    data['winddir_am'] = winddirAm;
    data['week'] = week;
    data['forecasttime'] = forecasttime;
    data['windpower_pm'] = windpowerPm;
    data['weather_pm'] = weatherPm;
    data['reporttime'] = reporttime;
    data['weather_index_pm'] = weatherIndexPm;
    data['winddir_pm'] = winddirPm;
    data['weather_am'] = weatherAm;
    data['sunrise_sunset'] = sunriseSunset;
    data['windpower_am'] = windpowerAm;
    data['weather_am_pic'] = weatherAmPic;
    data['temperature_pm'] = temperaturePm;
    data['weather_index_am'] = weatherIndexAm;
    return data;
  }
}

class Forecast24h {
  String? windDirectionDegree;
  String? weatherPic;
  String? forecasttime;
  String? windPower;
  String? weatherCode;
  String? temperature;
  String? weather;
  String? windDir;

  Forecast24h(
      {windDirectionDegree,
      weatherPic,
      forecasttime,
      windPower,
      weatherCode,
      temperature,
      weather,
      windDir});

  Forecast24h.fromJson(Map<String, dynamic> json) {
    windDirectionDegree = json['windDirectionDegree'];
    weatherPic = json['weatherPic'];
    forecasttime = json['forecasttime'];
    windPower = json['windPower'];
    weatherCode = json['weatherCode'];
    temperature = json['temperature'];
    weather = json['weather'];
    windDir = json['windDir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['windDirectionDegree'] = windDirectionDegree;
    data['weatherPic'] = weatherPic;
    data['forecasttime'] = forecasttime;
    data['windPower'] = windPower;
    data['weatherCode'] = weatherCode;
    data['temperature'] = temperature;
    data['weather'] = weather;
    data['windDir'] = windDir;
    return data;
  }
}
