import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/amap_geo_to_address.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/pages/weather_list/widgets/weather_card.dart';

class WeatherListPage extends StatefulWidget {
  const WeatherListPage({super.key});

  @override
  State<WeatherListPage> createState() => WeatherListPageState();
}

class WeatherListPageState extends State<WeatherListPage> {
  late List<City> currentProvinceCitys;
  late City currentCity;

  @override
  void initState() {
    super.initState();
    currentCity = City();
    currentProvinceCitys = [];
    getAddressInfo();
  }

  void getAddressInfo() async {
    final SharedPreferences store = await SharedPreferences.getInstance();
    String? addressStr = store.getString('local_location');
    if (addressStr == null) {
      throw Exception("store get address info failure");
    }
    // List<String> keys = store.getKeys().toList();
    // print(jsonDecode(addressStr));

    AmapAddressData address = AmapAddressData.fromJson(jsonDecode(addressStr));

    String addressProvince = address.province!;
    if (addressProvince.length > 1) {
      addressProvince =
          addressProvince.substring(0, addressProvince.length - 1);
    }
    String addressCity = address.city!;
    if (addressCity.length > 1) {
      addressCity = addressCity.substring(0, addressCity.length - 1);
    }

    List<City> cityList = await getChinaAllCityList();
    if (cityList.isEmpty) {
      throw Exception("getChinaAllCityList request failure");
    }
    // print(jsonEncode(cityList));

    for (City city in cityList) {
      if (city.provcn == addressProvince && city.districtcn == addressCity) {
        currentProvinceCitys.add(city);

        if (city.namecn == addressCity) {
          currentCity = city;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('首页'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 150,
                    height: 70,
                    child: Text(
                      '你好',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                          color: Colors.black12,
                        ),
                        width: 40,
                        height: 40,
                        child: IconButton(
                          iconSize: 25,
                          onPressed: () {
                            debugPrint("search");
                            context.pushNamed('/location/search');
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: WeatherListViw(
                  currentCity: currentCity,
                  currentProvinceCitys: currentProvinceCitys,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WeatherListViw extends StatefulWidget {
  const WeatherListViw({
    super.key,
    required this.currentCity,
    required this.currentProvinceCitys,
  });

  final List<City> currentProvinceCitys;
  final City currentCity;

  @override
  // ignore: library_private_types_in_public_api
  _WeatherListViwState createState() => _WeatherListViwState();
}

class _WeatherListViwState extends State<WeatherListViw> {
  late PageController pageController;
  late TabController tabController;
  int currentPage = 0;
  late List<Map<String, String>> weathers;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    pageController.addListener(() {});
    weathers = [
      {
        'provcn': '当前城市',
        'city': '北京',
        'weather': '晴',
        'pic': 'assets/weather_icon/d00.png',
        'temperature': '5',
      }
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            // 左右滑动
            onPageChanged: (int index) {
              setState(() {
                // log('当前的卡片是 $index');
                currentPage = index;
              });
            },
            reverse: false,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: WeatherCardWidget(
                  provcn: widget.currentCity.provcn ?? '',
                  city: widget.currentCity.namecn ?? '',
                  cityId: widget.currentCity.stationid ?? '',
                  weather: weathers[0]['weather'] ?? '',
                  pic: weathers[0]['pic'] ?? '',
                  temperature: weathers[0]['temperature'] ?? '',
                ),
              );
            },
            itemCount: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: clips(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: WeatherCardWidget(
                  provcn: widget.currentProvinceCitys[index].provcn ?? '',
                  city: widget.currentProvinceCitys[index].namecn ?? '',
                  cityId: widget.currentProvinceCitys[index].stationid ?? '',
                  weather: weathers[0]['weather'] ?? '',
                  pic: weathers[0]['pic'] ?? '',
                  temperature: weathers[0]['temperature'] ?? '',
                ),
              );
            },
            itemCount: widget.currentProvinceCitys.length,
          ),
        ),
      ],
    );
  }

  List<Widget> clips() {
    List<Widget> list = [];
    for (int i = 0; i < weathers.length; i++) {
      list.add(clipIndex(currentPage == i));
    }

    return list;
  }

  Widget clipIndex([bool selected = false]) {
    // log('seleced: $selected, curr: $currentPage');
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 10,
          height: 10,
          color: selected ? Colors.grey : Colors.grey.shade100,
        ),
      ),
    );
  }
}