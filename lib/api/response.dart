import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:weather_app/model/air_quality.dart';
import 'package:weather_app/model/area.dart';
import 'package:weather_app/model/b_geo_to_address.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/city_info.dart';
import 'package:weather_app/model/cityid_to_attractions.dart';
import 'package:weather_app/model/ip_to_address.dart';
import 'package:weather_app/model/recommend.dart';
import 'package:weather_app/model/related_weather.dart';

import 'package:weather_app/model/sun_and_moon.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/weather_news.dart';
import 'package:weather_app/model/weather_video.dart';
import 'package:weather_app/model/win_hot_city.dart';
import 'package:weather_app/model/win_hot_country_list.dart';
import 'package:weather_app/model/win_hot_country_obs_capl.dart';
import 'package:weather_app/config/weather_api.dart';

Future<List<dynamic>> getJsJsonResult(
  String authority, [
  String unencodedPath = '',
  Map<String, dynamic>? queryParameters,
]) async {
  try {
    var url = Uri.https(authority, unencodedPath, queryParameters);
    var response = await http.get(url);
    var body = response.body;
    int contentStartIndex = body.indexOf('[');
    var jsonData = body.substring(contentStartIndex);
    List<dynamic> stringList = jsonDecode(jsonData);

    return stringList;
  } on Exception {
    rethrow;
  }
}

Future<List<Area>> getAreas() async {
  List<dynamic> list = await getJsJsonResult(
    WEATHER_API_HOST,
    'cctv/js/area.js',
  );
  return list.map((e) => Area.fromJson(e)).toList();
}

Future<List<City>> getChinaAllCityList() async {
  List<dynamic> list = await getJsJsonResult(
    CFG_WEATHER_API_HOST,
    'js/arealist.js',
  );
  List<City> citys = list.map((city) => City.fromJson(city)).toList();
  log(citys[0].namecn!);

  return citys;
}

Future<CityInfo> getCityInfo(String cityid) async {
  var url = Uri.https(
      WEATHER_API_HOST, 'api/getCityInfo', {'type': 'cityid', 'id': cityid});
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  CityInfo city = CityInfo.fromJson(resps['data']);
  log(city.namecn!);

  return city;
}

Future<Weather> getCurrAnd15dAnd24h(String cityid) async {
  var url = Uri.https(
      WEATHER_API_HOST, 'api/home/getCurrAnd15dAnd24h', {'id': cityid});
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  Weather weather = Weather.fromJson(resps['data']);
  log(weather.current!.nongLi!);

  return weather;
}

Future<RelatedWeather> getRelatedWeather(String cityid) async {
  var url =
      Uri.https(WEATHER_API_HOST, 'api/home/getRelatedWeather', {'id': cityid});
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  RelatedWeather relatedWeather = RelatedWeather.fromJson(resps['data']);
  log(relatedWeather.relateJc!.toString());

  return relatedWeather;
}

Future<SunAndMoonAndIndex> getSunMoonAndIndex(String cityid) async {
  var url = Uri.https(
      WEATHER_API_HOST, 'api/home/getSunMoonAndIndex', {'id': cityid});
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  SunAndMoonAndIndex data = SunAndMoonAndIndex.fromJson(resps['data']);
  log(data.index!.length.toString());

  return data;
}

Future<AirQuality> getAirOrder([String ordery = 'ASC']) async {
  var url = Uri.https(
      WEATHER_API_HOST, 'api/getAirOrder', {'order': ordery, 'number': 10});
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  AirQuality data = AirQuality.fromJson(resps['data']);
  log(data.districtcn!);

  return data;
}

Future<City> getCityStationDisData(String provcn) async {
  var url = Uri.https(
      WEATHER_API_HOST, 'api/getCityStationDisData', {'provcn': 'provcn'});
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  City data = City.fromJson(resps['data']);
  log(data.districtcn!);

  return data;
}

Future<CityidToAttractions> getD3aJQStation(String cityid) async {
  var url =
      Uri.https(WEATHER_API_HOST, 'api/d3a/getD3aJQStation', {'id': cityid});
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  CityidToAttractions data = CityidToAttractions.fromJson(resps['data']);
  log(data.areaid!);

  return data;
}

Future<WeatherNews> getWeatherNews() async {
  var url = Uri.https(
    WEATHER_API_HOST,
    'api/infor/getWeatherNews',
    {'tag': '', 'subject': '', 'limit': 8, 'page': 1, 'type': '1'},
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  WeatherNews data = WeatherNews.fromJson(resps['data']);
  log(data.totalCount!.bitLength.toString());

  return data;
}

Future<WeatherVideo> getVideoList() async {
  var url = Uri.https(
    WEATHER_API_HOST,
    'api/videoList',
    {'stationid': '', 'weather': '00', 'type': '', 'videopar': ''},
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  WeatherVideo data = WeatherVideo.fromJson(resps['data']);
  log(data.lbvideo!.beforeYesterday!.vidDate!);

  return data;
}

Future<WeatherVideo> getVideoDataByType() async {
  var url = Uri.https(
    WEATHER_API_HOST,
    'api/getVideoDataByType',
    {'limit': 9, 'page': 1, 'type': ''},
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  WeatherVideo data = WeatherVideo.fromJson(resps['data']);
  log(data.lbvideo!.beforeYesterday!.vidDate!);

  return data;
}

Future<Recommend> getSubjectOnLine() async {
  var url = Uri.https(
    WEATHER_API_HOST,
    'api/getSubjectOnLine',
    {'banner': 'Y'},
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  Recommend data = Recommend.fromJson(resps['data']);
  log(data.bannerImg!);

  return data;
}

Future<WniHotCountryList> getWniHotCountryGroupBy() async {
  var url = Uri.https(
    WEATHER_API_HOST,
    'api/getWniHotcountryGroupBy',
  );
  var response = await http.get(url, headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
  });

  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  WniHotCountryList data = WniHotCountryList.fromJson(resps['data']);
  return data;
}

Future<WniHotCity> getWniHotCity() async {
  var url = Uri.https(
    WEATHER_API_HOST,
    'js/json/wni_hotCity.json',
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  WniHotCity data = WniHotCity.fromJson(resps['data']);
  log(data.name!);

  return data;
}

Future<WniHotCountryObsCapl> getWniHotCountryOBSCaplData(String ids) async {
  var url = Uri.https(
    WEATHER_API_HOST,
    'api/getWniHotcountryOBSCaplData',
    {'ids': ids},
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  WniHotCountryObsCapl data = WniHotCountryObsCapl.fromJson(resps['data']);
  log(data.iconPic!);

  return data;
}

Future<BGeoToAddress> getAmapGeoToAddress(
    double latitude, double longitude) async {
  var url = Uri.https(
    AMAP_API_HOST,
    'service/regeo',
    {
      'longitude': '$longitude',
      'latitude': '$latitude',
    },
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  BGeoToAddress data = BGeoToAddress.fromJson(resps['result']);

  return data;
}

Future<BGeoToAddress> getGeoToAddress(double latitude, double longitude) async {
  var url = Uri.https(
    BD_MAP_API_HOST,
    'geocoder',
    {
      'output': 'json',
      'location': '$latitude,$longitude',
      'key': '37492c0ee6f924cb5e934fa08c6b1676',
    },
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  BGeoToAddress data = BGeoToAddress.fromJson(resps['result']);

  return data;
}

Future<BGeoToAddress> getAddressToGeo(String address) async {
  var url = Uri.https(
    BD_MAP_API_HOST,
    'geocoder',
    {
      'output': 'json',
      'address': address,
      'city': '',
      'key': '37492c0ee6f924cb5e934fa08c6b1676',
    },
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  BGeoToAddress data = BGeoToAddress.fromJson(resps['result']);

  return data;
}

Future<IpAndAddress> getIpAndAddress() async {
  var url = Uri.https(
    IP_CN_HOST,
    'api/index',
    {
      'type': '0', // 1时: 检测是不是自已的网络
    },
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  IpAndAddress data = IpAndAddress.fromJson(resps['result']);

  return data;
}
