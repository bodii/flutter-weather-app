import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/home/widgets/search.dart';
import 'package:weather_app/pages/home/widgets/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // LocationData? currentLocation;
  // Address? address;

  @override
  void initState() {
    super.initState();
    /*
    try {
      getLocation().then((value) {
        LocationData? location = value;
        log('latitude: ${location?.latitude}, '
            'longitude: ${location?.longitude}');
        if (location != null) {
          log('bbb');
          double latitude = location.latitude ?? 0.0;
          double longitude = location.longitude ?? 0.0;
          getGeoToAddress(latitude, longitude).then((v) {
            BGeoToAddress bGeoToAddress = v;
            log(bGeoToAddress.toJson().toString());
          });
        }
      });
    } catch (e) {
      log('get location failure');
    }
    */
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const Search()));
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Index(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
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
      },
      {
        'provcn': '当前城市',
        'city': '上海',
        'weather': '多云',
        'pic': 'assets/weather_icon/d01.png',
        'temperature': '3',
      },
      {
        'provcn': '当前城市',
        'city': '天津',
        'weather': '多云',
        'pic': 'assets/weather_icon/d01.png',
        'temperature': '3',
      },
      {
        'provcn': '当前城市',
        'city': '大连',
        'weather': '多云',
        'pic': 'assets/weather_icon/d01.png',
        'temperature': '3',
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
              Map<String, String> data = weathers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => context.goNamed('weather',
                      pathParameters: {'city': data['city'] ?? '北京'}),
                  child: WeatherCardWidget(
                    provcn: data['provcn'] ?? '',
                    city: data['city'] ?? '',
                    weather: data['weather'] ?? '',
                    pic: data['pic'] ?? '',
                    temperature: data['temperature'] ?? '',
                  ),
                ),
              );
            },
            itemCount: weathers.length,
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
                  provcn: weathers[index]['provcn'] ?? '',
                  city: weathers[index]['city'] ?? '',
                  weather: weathers[index]['weather'] ?? '',
                  pic: weathers[index]['pic'] ?? '',
                  temperature: weathers[index]['temperature'] ?? '',
                ),
              );
            },
            itemCount: weathers.length,
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
