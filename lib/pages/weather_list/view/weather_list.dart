import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/error/error_page.dart';
import 'package:weather_app/pages/weather_list/bloc/weather_list_bloc.dart';
import 'package:weather_app/pages/weather_list/widgets/weather_card.dart';

class WeatherListPage extends StatelessWidget {
  const WeatherListPage({super.key});

  // void getAddressInfo() async {
  //   final SharedPreferences store = await SharedPreferences.getInstance();
  //   String? addressStr = store.getString('local_location');
  //   if (addressStr == null) {
  //     throw Exception("store get address info failure");
  //   }
  //   // List<String> keys = store.getKeys().toList();
  //   // print(jsonDecode(addressStr));

  //   AmapAddressData address = AmapAddressData.fromJson(jsonDecode(addressStr));

  //   String addressProvince = address.province!;
  //   if (addressProvince.length > 1) {
  //     addressProvince =
  //         addressProvince.substring(0, addressProvince.length - 1);
  //   }
  //   String addressCity = address.city!;
  //   if (addressCity.length > 1) {
  //     addressCity = addressCity.substring(0, addressCity.length - 1);
  //   }

  //   List<City> cityList = await getChinaAllCityList();
  //   if (cityList.isEmpty) {
  //     throw Exception("getChinaAllCityList request failure");
  //   }
  //   // print(jsonEncode(cityList));

  //   for (City city in cityList) {
  //     if (city.provcn == addressProvince && city.districtcn == addressCity) {
  //       currentProvinceCitys.add(city);

  //       if (city.namecn == addressCity) {
  //         currentCity = city;
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherListBloc()..add(WeatherListGetAddressEvent()),
      child: const WeatherListBlocView(),
    );
  }
}

class WeatherListBlocView extends StatelessWidget {
  const WeatherListBlocView({super.key});

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
              const Expanded(
                child: WeatherListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherListView extends StatefulWidget {
  const WeatherListView({super.key});

  static const List<Map<String, String>> weathers = [
    {
      'provcn': '当前城市',
      'city': '北京',
      'weather': '晴',
      'pic': 'assets/weather_icon/d00.png',
      'temperature': '5',
    }
  ];

  @override
  State<WeatherListView> createState() => _WeatherListViewState();
}

class _WeatherListViewState extends State<WeatherListView> {
  late final PageController pageController;

  // late TabController tabController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    pageController.addListener(() {});

    // tabController = TabController(length: length, vsync: vsync)
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherListBloc, WeatherListState>(
      builder: (context, state) {
        debugPrint(state.status.toString());
        switch (state.status) {
          case WeatherListStatus.inProgress || WeatherListStatus.init:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case WeatherListStatus.success:
            return listView(context, state);
          case WeatherListStatus.failure:
            return ErrorPage(Exception('加载失败'));
        }
      },
    );
  }

  Widget listView(BuildContext context, WeatherListState state) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            // 左右滑动
            onPageChanged: (int index) {},
            reverse: false,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: WeatherCardWidget(
                  provcn: state.localCity == state.currentCity!.namecn
                      ? '当前城市'
                      : state.currentCity!.provcn!,
                  city: state.currentCity!.namecn!,
                  cityId: state.currentCity!.stationid!,
                  weather: WeatherListView.weathers[0]['weather'] ?? '',
                  pic: WeatherListView.weathers[0]['pic'] ?? '',
                  temperature: WeatherListView.weathers[0]['temperature'] ?? '',
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
                  provcn: state.currentProvinceCitys![index].provcn ?? '',
                  city: state.currentProvinceCitys![index].namecn ?? '',
                  cityId: state.currentProvinceCitys![index].stationid ?? '',
                  weather: WeatherListView.weathers[0]['weather'] ?? '',
                  pic: WeatherListView.weathers[0]['pic'] ?? '',
                  temperature: WeatherListView.weathers[0]['temperature'] ?? '',
                ),
              );
            },
            itemCount: state.currentProvinceCitys!.length,
          ),
        ),
      ],
    );
  }

  List<Widget> clips() {
    List<Widget> list = [];
    for (int i = 0; i < WeatherListView.weathers.length; i++) {
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
