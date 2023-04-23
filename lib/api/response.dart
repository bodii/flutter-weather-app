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
import 'package:weather_app/model/wni_hot_country_data.dart';

// 将js返回的数据转返回成json，再将json转换成对象
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

// 天气接口 ｜ 编号对应的城市 省市分层
Future<List<Area>> getAreas() async {
  List<dynamic> list = await getJsJsonResult(
    WEATHER_API_HOST,
    'cctv/js/area.js',
  );
  return list.map((e) => Area.fromJson(e)).toList();
}

// 天气接口 | 编号对应的城市 省市不分层
Future<List<City>> getChinaAllCityList() async {
  List<dynamic> list = await getJsJsonResult(
    CFG_WEATHER_API_HOST,
    'js/arealist.js',
  );
  List<City> citys = list.map((city) => City.fromJson(city)).toList();
  log(citys[0].namecn!);

  return citys;
}

// 天气接口 | 获取城市的经纬度
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

// 天气接口 | 获取当前天气 ＆ 15天 & 24小时
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

// 天气接口 | 获取每个区的天气
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

// 天气接口 | 获取日月和指数
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

// 天气接口 | 获取天气污染的10个城市
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

// 天气接口 | 根据省份城市获取各区市编号
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

// 天气接口 | 获取到相关城市的著名景点位置信息
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

// 天气接口 | 获取相关新闻接口
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

// 天气接口 | 附加视频
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

// 天气接口 | 获取气相相关视频内容
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

// 天气接口 ｜ 获取一个推荐内容
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

// 六大洲及其包含国家数据
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

// 国际热门城市数据
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

// 国际天气：当前主要天气信息
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

  return data;
}

// 国际天气数据： 当天、72小时、15天
Future<WniHotCountryData> getWniHotCountryData(String id) async {
  var url = Uri.https(
    WEATHER_API_HOST,
    'api/getWniHotcountryData',
    {'id': id},
  );
  var response = await http.get(url);
  var body = response.body;
  Map<String, dynamic> resps = jsonDecode(body);
  WniHotCountryData data = WniHotCountryData.fromJson(resps['data']);

  return data;
}

// 高德地图:通过geo返回地址信息
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

// 百度地图：通过geo返回地址信息
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

// 百度地图：通过地址信息返回geo
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

// ip.cn通过访问ip返回地址信息
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
