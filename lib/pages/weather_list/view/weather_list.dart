import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/error/error_page.dart';
import 'package:weather_app/pages/weather_list/bloc/weather_list_bloc.dart';
import 'package:weather_app/pages/weather_list/widgets/weather_card.dart';

class WeatherListPage extends StatelessWidget {
  const WeatherListPage({super.key});

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
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    pageController.addListener(() {});
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
          height: 190,
          child: PageView.builder(
            // 左右滑动
            onPageChanged: (int index) {
              setState(() {
                currentPage = index;
              });
            },
            reverse: false,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              return WeatherCardWidget(
                provcn: '当前城市',
                city: state.cityWeather!.namecn!,
                cityId: state.cityWeather!.id!,
                weather: state.cityWeather!.winddirAm!,
                pic: WeatherListView.weathers[0]['pic'] ?? '',
                temperature: state.cityWeather!.temperatureAm!,
              );
            },
            itemCount: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: clips(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return WeatherCardWidget(
                provcn: state.province!,
                city: state.provinceCitysWeather![index].namecn ?? '',
                cityId: state.provinceCitysWeather![index].id ?? '',
                weather: state.provinceCitysWeather![index].winddirAm ?? '',
                pic: WeatherListView.weathers[0]['pic'] ?? '',
                temperature:
                    state.provinceCitysWeather![index].temperatureAm ?? '',
              );
            },
            itemCount: state.provinceCitysWeather!.length,
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
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: CircleAvatar(
        radius: 5,
        backgroundColor: selected
            ? Theme.of(context).colorScheme.outline
            : Theme.of(context).colorScheme.outlineVariant,
      ),
    );
  }
}
