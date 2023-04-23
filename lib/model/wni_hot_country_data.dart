class WniHotCountryData {
  Current? current;
  Forecast72H? forecast72H;
  Forecast15D? forecast15D;

  WniHotCountryData({this.current, this.forecast72H, this.forecast15D});

  WniHotCountryData.fromJson(Map<String, dynamic> json) {
    if (json["current"] is Map) {
      current =
          json["current"] == null ? null : Current.fromJson(json["current"]);
    }
    if (json["forecast72h"] is Map) {
      forecast72H = json["forecast72h"] == null
          ? null
          : Forecast72H.fromJson(json["forecast72h"]);
    }
    if (json["forecast15d"] is Map) {
      forecast15D = json["forecast15d"] == null
          ? null
          : Forecast15D.fromJson(json["forecast15d"]);
    }
  }

  static List<WniHotCountryData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => WniHotCountryData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (current != null) {
      _data["current"] = current?.toJson();
    }
    if (forecast72H != null) {
      _data["forecast72h"] = forecast72H?.toJson();
    }
    if (forecast15D != null) {
      _data["forecast15d"] = forecast15D?.toJson();
    }
    return _data;
  }

  WniHotCountryData copyWith({
    Current? current,
    Forecast72H? forecast72H,
    Forecast15D? forecast15D,
  }) =>
      WniHotCountryData(
        current: current ?? this.current,
        forecast72H: forecast72H ?? this.forecast72H,
        forecast15D: forecast15D ?? this.forecast15D,
      );
}

class Forecast15D {
  String? publishTime;
  String? updateTime;
  List<Forecast>? forecast;
  String? id;

  Forecast15D({this.publishTime, this.updateTime, this.forecast, this.id});

  Forecast15D.fromJson(Map<String, dynamic> json) {
    if (json["publishTime"] is String) {
      publishTime = json["publishTime"];
    }
    if (json["update_time"] is String) {
      updateTime = json["update_time"];
    }
    if (json["forecast"] is List) {
      forecast = json["forecast"] == null
          ? null
          : (json["forecast"] as List)
              .map((e) => Forecast.fromJson(e))
              .toList();
    }
    if (json["id"] is String) {
      id = json["id"];
    }
  }

  static List<Forecast15D> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Forecast15D.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["publishTime"] = publishTime;
    _data["update_time"] = updateTime;
    if (forecast != null) {
      _data["forecast"] = forecast?.map((e) => e.toJson()).toList();
    }
    _data["id"] = id;
    return _data;
  }

  Forecast15D copyWith({
    String? publishTime,
    String? updateTime,
    List<Forecast>? forecast,
    String? id,
  }) =>
      Forecast15D(
        publishTime: publishTime ?? this.publishTime,
        updateTime: updateTime ?? this.updateTime,
        forecast: forecast ?? this.forecast,
        id: id ?? this.id,
      );
}

class Forecast {
  String? nightIcon;
  String? nightPop;
  String? rise;
  String? nightWPower;
  String? dayWDirTextCn;
  String? set;
  String? dayWSpeed;
  String? nightWSpeed;
  String? dayIcon;
  String? dayHumid;
  String? dayIconText;
  String? dayWPower;
  String? nightWDirText;
  String? nightWDirTextCn;
  String? minTemp;
  String? dayWDir;
  String? nightHumid;
  String? validDate;
  String? dayWDirText;
  String? nightIconText;
  String? maxTemp;
  String? nightWDir;
  String? week;
  String? validDateCn;
  String? dayPop;

  Forecast(
      {this.nightIcon,
      this.nightPop,
      this.rise,
      this.nightWPower,
      this.dayWDirTextCn,
      this.set,
      this.dayWSpeed,
      this.nightWSpeed,
      this.dayIcon,
      this.dayHumid,
      this.dayIconText,
      this.dayWPower,
      this.nightWDirText,
      this.nightWDirTextCn,
      this.minTemp,
      this.dayWDir,
      this.nightHumid,
      this.validDate,
      this.dayWDirText,
      this.nightIconText,
      this.maxTemp,
      this.nightWDir,
      this.week,
      this.validDateCn,
      this.dayPop});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json["night_icon"] is String) {
      nightIcon = json["night_icon"];
    }
    if (json["night_pop"] is String) {
      nightPop = json["night_pop"];
    }
    if (json["rise"] is String) {
      rise = json["rise"];
    }
    if (json["night_wPower"] is String) {
      nightWPower = json["night_wPower"];
    }
    if (json["day_wDirTextCN"] is String) {
      dayWDirTextCn = json["day_wDirTextCN"];
    }
    if (json["set"] is String) {
      set = json["set"];
    }
    if (json["day_wSpeed"] is String) {
      dayWSpeed = json["day_wSpeed"];
    }
    if (json["night_wSpeed"] is String) {
      nightWSpeed = json["night_wSpeed"];
    }
    if (json["day_icon"] is String) {
      dayIcon = json["day_icon"];
    }
    if (json["day_humid"] is String) {
      dayHumid = json["day_humid"];
    }
    if (json["day_iconText"] is String) {
      dayIconText = json["day_iconText"];
    }
    if (json["day_wPower"] is String) {
      dayWPower = json["day_wPower"];
    }
    if (json["night_wDirText"] is String) {
      nightWDirText = json["night_wDirText"];
    }
    if (json["night_wDirTextCN"] is String) {
      nightWDirTextCn = json["night_wDirTextCN"];
    }
    if (json["minTemp"] is String) {
      minTemp = json["minTemp"];
    }
    if (json["day_wDir"] is String) {
      dayWDir = json["day_wDir"];
    }
    if (json["night_humid"] is String) {
      nightHumid = json["night_humid"];
    }
    if (json["validDate"] is String) {
      validDate = json["validDate"];
    }
    if (json["day_wDirText"] is String) {
      dayWDirText = json["day_wDirText"];
    }
    if (json["night_iconText"] is String) {
      nightIconText = json["night_iconText"];
    }
    if (json["maxTemp"] is String) {
      maxTemp = json["maxTemp"];
    }
    if (json["night_wDir"] is String) {
      nightWDir = json["night_wDir"];
    }
    if (json["week"] is String) {
      week = json["week"];
    }
    if (json["validDateCN"] is String) {
      validDateCn = json["validDateCN"];
    }
    if (json["day_pop"] is String) {
      dayPop = json["day_pop"];
    }
  }

  static List<Forecast> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Forecast.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["night_icon"] = nightIcon;
    _data["night_pop"] = nightPop;
    _data["rise"] = rise;
    _data["night_wPower"] = nightWPower;
    _data["day_wDirTextCN"] = dayWDirTextCn;
    _data["set"] = set;
    _data["day_wSpeed"] = dayWSpeed;
    _data["night_wSpeed"] = nightWSpeed;
    _data["day_icon"] = dayIcon;
    _data["day_humid"] = dayHumid;
    _data["day_iconText"] = dayIconText;
    _data["day_wPower"] = dayWPower;
    _data["night_wDirText"] = nightWDirText;
    _data["night_wDirTextCN"] = nightWDirTextCn;
    _data["minTemp"] = minTemp;
    _data["day_wDir"] = dayWDir;
    _data["night_humid"] = nightHumid;
    _data["validDate"] = validDate;
    _data["day_wDirText"] = dayWDirText;
    _data["night_iconText"] = nightIconText;
    _data["maxTemp"] = maxTemp;
    _data["night_wDir"] = nightWDir;
    _data["week"] = week;
    _data["validDateCN"] = validDateCn;
    _data["day_pop"] = dayPop;
    return _data;
  }

  Forecast copyWith({
    String? nightIcon,
    String? nightPop,
    String? rise,
    String? nightWPower,
    String? dayWDirTextCn,
    String? set,
    String? dayWSpeed,
    String? nightWSpeed,
    String? dayIcon,
    String? dayHumid,
    String? dayIconText,
    String? dayWPower,
    String? nightWDirText,
    String? nightWDirTextCn,
    String? minTemp,
    String? dayWDir,
    String? nightHumid,
    String? validDate,
    String? dayWDirText,
    String? nightIconText,
    String? maxTemp,
    String? nightWDir,
    String? week,
    String? validDateCn,
    String? dayPop,
  }) =>
      Forecast(
        nightIcon: nightIcon ?? this.nightIcon,
        nightPop: nightPop ?? this.nightPop,
        rise: rise ?? this.rise,
        nightWPower: nightWPower ?? this.nightWPower,
        dayWDirTextCn: dayWDirTextCn ?? this.dayWDirTextCn,
        set: set ?? this.set,
        dayWSpeed: dayWSpeed ?? this.dayWSpeed,
        nightWSpeed: nightWSpeed ?? this.nightWSpeed,
        dayIcon: dayIcon ?? this.dayIcon,
        dayHumid: dayHumid ?? this.dayHumid,
        dayIconText: dayIconText ?? this.dayIconText,
        dayWPower: dayWPower ?? this.dayWPower,
        nightWDirText: nightWDirText ?? this.nightWDirText,
        nightWDirTextCn: nightWDirTextCn ?? this.nightWDirTextCn,
        minTemp: minTemp ?? this.minTemp,
        dayWDir: dayWDir ?? this.dayWDir,
        nightHumid: nightHumid ?? this.nightHumid,
        validDate: validDate ?? this.validDate,
        dayWDirText: dayWDirText ?? this.dayWDirText,
        nightIconText: nightIconText ?? this.nightIconText,
        maxTemp: maxTemp ?? this.maxTemp,
        nightWDir: nightWDir ?? this.nightWDir,
        week: week ?? this.week,
        validDateCn: validDateCn ?? this.validDateCn,
        dayPop: dayPop ?? this.dayPop,
      );
}

class Forecast72H {
  String? updateTime;
  String? id;
  List<Value>? value;

  Forecast72H({this.updateTime, this.id, this.value});

  Forecast72H.fromJson(Map<String, dynamic> json) {
    if (json["update_time"] is String) {
      updateTime = json["update_time"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["value"] is List) {
      value = json["value"] == null
          ? null
          : (json["value"] as List).map((e) => Value.fromJson(e)).toList();
    }
  }

  static List<Forecast72H> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Forecast72H.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["update_time"] = updateTime;
    _data["id"] = id;
    if (value != null) {
      _data["value"] = value?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Forecast72H copyWith({
    String? updateTime,
    String? id,
    List<Value>? value,
  }) =>
      Forecast72H(
        updateTime: updateTime ?? this.updateTime,
        id: id ?? this.id,
        value: value ?? this.value,
      );
}

class Value {
  String? dateTime;
  String? iconDecoder;
  String? temp;
  String? icon;
  String? dateTimeDb;
  String? wspeed;
  String? humid;
  String? pop;
  String? feelsLike;
  String? wdirTextCn;
  String? wdirText;
  String? dew;
  String? iconPic;

  Value(
      {this.dateTime,
      this.iconDecoder,
      this.temp,
      this.icon,
      this.dateTimeDb,
      this.wspeed,
      this.humid,
      this.pop,
      this.feelsLike,
      this.wdirTextCn,
      this.wdirText,
      this.dew,
      this.iconPic});

  Value.fromJson(Map<String, dynamic> json) {
    if (json["dateTime"] is String) {
      dateTime = json["dateTime"];
    }
    if (json["iconDecoder"] is String) {
      iconDecoder = json["iconDecoder"];
    }
    if (json["temp"] is String) {
      temp = json["temp"];
    }
    if (json["icon"] is String) {
      icon = json["icon"];
    }
    if (json["dateTime_db"] is String) {
      dateTimeDb = json["dateTime_db"];
    }
    if (json["wspeed"] is String) {
      wspeed = json["wspeed"];
    }
    if (json["humid"] is String) {
      humid = json["humid"];
    }
    if (json["pop"] is String) {
      pop = json["pop"];
    }
    if (json["feelsLike"] is String) {
      feelsLike = json["feelsLike"];
    }
    if (json["wdirTextCN"] is String) {
      wdirTextCn = json["wdirTextCN"];
    }
    if (json["wdirText"] is String) {
      wdirText = json["wdirText"];
    }
    if (json["dew"] is String) {
      dew = json["dew"];
    }
    if (json["iconPic"] is String) {
      iconPic = json["iconPic"];
    }
  }

  static List<Value> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Value.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["dateTime"] = dateTime;
    _data["iconDecoder"] = iconDecoder;
    _data["temp"] = temp;
    _data["icon"] = icon;
    _data["dateTime_db"] = dateTimeDb;
    _data["wspeed"] = wspeed;
    _data["humid"] = humid;
    _data["pop"] = pop;
    _data["feelsLike"] = feelsLike;
    _data["wdirTextCN"] = wdirTextCn;
    _data["wdirText"] = wdirText;
    _data["dew"] = dew;
    _data["iconPic"] = iconPic;
    return _data;
  }

  Value copyWith({
    String? dateTime,
    String? iconDecoder,
    String? temp,
    String? icon,
    String? dateTimeDb,
    String? wspeed,
    String? humid,
    String? pop,
    String? feelsLike,
    String? wdirTextCn,
    String? wdirText,
    String? dew,
    String? iconPic,
  }) =>
      Value(
        dateTime: dateTime ?? this.dateTime,
        iconDecoder: iconDecoder ?? this.iconDecoder,
        temp: temp ?? this.temp,
        icon: icon ?? this.icon,
        dateTimeDb: dateTimeDb ?? this.dateTimeDb,
        wspeed: wspeed ?? this.wspeed,
        humid: humid ?? this.humid,
        pop: pop ?? this.pop,
        feelsLike: feelsLike ?? this.feelsLike,
        wdirTextCn: wdirTextCn ?? this.wdirTextCn,
        wdirText: wdirText ?? this.wdirText,
        dew: dew ?? this.dew,
        iconPic: iconPic ?? this.iconPic,
      );
}

class Current {
  String? date;
  String? uvindex;
  String? temp;
  String? wPower;
  String? iconDecoder;
  String? visibility;
  String? wSpeed;
  String? pressure;
  String? humid;
  String? dewPoint;
  String? tempMin24;
  String? wDirText;
  String? feelsLike;
  String? wxIcon;
  String? precip24Amount;
  String? ctindex;
  String? id;
  String? tempMax24;
  String? iconPic;
  String? key;
  String? wDirDecoder;
  String? reportTime;

  Current(
      {this.date,
      this.uvindex,
      this.temp,
      this.wPower,
      this.iconDecoder,
      this.visibility,
      this.wSpeed,
      this.pressure,
      this.humid,
      this.dewPoint,
      this.tempMin24,
      this.wDirText,
      this.feelsLike,
      this.wxIcon,
      this.precip24Amount,
      this.ctindex,
      this.id,
      this.tempMax24,
      this.iconPic,
      this.key,
      this.wDirDecoder,
      this.reportTime});

  Current.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["uvindex"] is String) {
      uvindex = json["uvindex"];
    }
    if (json["temp"] is String) {
      temp = json["temp"];
    }
    if (json["wPower"] is String) {
      wPower = json["wPower"];
    }
    if (json["iconDecoder"] is String) {
      iconDecoder = json["iconDecoder"];
    }
    if (json["visibility"] is String) {
      visibility = json["visibility"];
    }
    if (json["wSpeed"] is String) {
      wSpeed = json["wSpeed"];
    }
    if (json["pressure"] is String) {
      pressure = json["pressure"];
    }
    if (json["humid"] is String) {
      humid = json["humid"];
    }
    if (json["dewPoint"] is String) {
      dewPoint = json["dewPoint"];
    }
    if (json["tempMin24"] is String) {
      tempMin24 = json["tempMin24"];
    }
    if (json["wDirText"] is String) {
      wDirText = json["wDirText"];
    }
    if (json["feelsLike"] is String) {
      feelsLike = json["feelsLike"];
    }
    if (json["wxIcon"] is String) {
      wxIcon = json["wxIcon"];
    }
    if (json["precip24Amount"] is String) {
      precip24Amount = json["precip24Amount"];
    }
    if (json["ctindex"] is String) {
      ctindex = json["ctindex"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["tempMax24"] is String) {
      tempMax24 = json["tempMax24"];
    }
    if (json["iconPic"] is String) {
      iconPic = json["iconPic"];
    }
    if (json["key"] is String) {
      key = json["key"];
    }
    if (json["wDirDecoder"] is String) {
      wDirDecoder = json["wDirDecoder"];
    }
    if (json["reportTime"] is String) {
      reportTime = json["reportTime"];
    }
  }

  static List<Current> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Current.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["date"] = date;
    _data["uvindex"] = uvindex;
    _data["temp"] = temp;
    _data["wPower"] = wPower;
    _data["iconDecoder"] = iconDecoder;
    _data["visibility"] = visibility;
    _data["wSpeed"] = wSpeed;
    _data["pressure"] = pressure;
    _data["humid"] = humid;
    _data["dewPoint"] = dewPoint;
    _data["tempMin24"] = tempMin24;
    _data["wDirText"] = wDirText;
    _data["feelsLike"] = feelsLike;
    _data["wxIcon"] = wxIcon;
    _data["precip24Amount"] = precip24Amount;
    _data["ctindex"] = ctindex;
    _data["id"] = id;
    _data["tempMax24"] = tempMax24;
    _data["iconPic"] = iconPic;
    _data["key"] = key;
    _data["wDirDecoder"] = wDirDecoder;
    _data["reportTime"] = reportTime;
    return _data;
  }

  Current copyWith({
    String? date,
    String? uvindex,
    String? temp,
    String? wPower,
    String? iconDecoder,
    String? visibility,
    String? wSpeed,
    String? pressure,
    String? humid,
    String? dewPoint,
    String? tempMin24,
    String? wDirText,
    String? feelsLike,
    String? wxIcon,
    String? precip24Amount,
    String? ctindex,
    String? id,
    String? tempMax24,
    String? iconPic,
    String? key,
    String? wDirDecoder,
    String? reportTime,
  }) =>
      Current(
        date: date ?? this.date,
        uvindex: uvindex ?? this.uvindex,
        temp: temp ?? this.temp,
        wPower: wPower ?? this.wPower,
        iconDecoder: iconDecoder ?? this.iconDecoder,
        visibility: visibility ?? this.visibility,
        wSpeed: wSpeed ?? this.wSpeed,
        pressure: pressure ?? this.pressure,
        humid: humid ?? this.humid,
        dewPoint: dewPoint ?? this.dewPoint,
        tempMin24: tempMin24 ?? this.tempMin24,
        wDirText: wDirText ?? this.wDirText,
        feelsLike: feelsLike ?? this.feelsLike,
        wxIcon: wxIcon ?? this.wxIcon,
        precip24Amount: precip24Amount ?? this.precip24Amount,
        ctindex: ctindex ?? this.ctindex,
        id: id ?? this.id,
        tempMax24: tempMax24 ?? this.tempMax24,
        iconPic: iconPic ?? this.iconPic,
        key: key ?? this.key,
        wDirDecoder: wDirDecoder ?? this.wDirDecoder,
        reportTime: reportTime ?? this.reportTime,
      );
}
