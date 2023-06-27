import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/welcome/widgets/worlds_widget/index.dart';

const worlds = [
  AsiaMapWidget(),
  EuropeMapWidget(),
  NorthAmericaMapWidget(),
  SouthAmericaMapWidget(),
  AfriceMapWidget(),
  OceaniaMapWidget(),
];

class WorldsWidget extends StatefulWidget {
  const WorldsWidget({super.key});

  @override
  State<WorldsWidget> createState() => _WorldsWidgetState();
}

class _WorldsWidgetState extends State<WorldsWidget> {
  PageController worldsPage = PageController();
  int currentIndex = 0;

  late String networkStateText;

  @override
  void initState() {
    super.initState();
    worldsPage.addListener(() {});
    // checkNetworkConn();
  }

  @override
  void dispose() {
    worldsPage.dispose();
    super.dispose();
  }

  Future checkNetworkConn() async {
    final ConnectivityResult connectionstate =
        await Connectivity().checkConnectivity();
    if (connectionstate == ConnectivityResult.wifi) {
      networkStateText = '当前处于wifi网络';
    } else if (connectionstate == ConnectivityResult.mobile) {
      networkStateText = '当前处于数据流量网络';
    } else {
      networkStateText = '网络链接失败';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;

    return Column(
      children: [
        SizedBox(
          width: screenWidth,
          height: screenWidth * 0.8,
          child: PageView.builder(
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            reverse: false,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: worldsPage,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  worlds.elementAt(currentIndex),
                ],
              );
            },
            itemCount: worlds.length,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: clips(),
        ),
      ],
    );
  }

  List<Widget> clips() {
    List<Widget> list = [];
    for (int i = 0; i < worlds.length; i++) {
      list.add(clipIndex(currentIndex == i));
    }

    return list;
  }

  Widget clipIndex([bool selected = false]) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 10,
          height: 10,
          color: selected
              ? Theme.of(context).colorScheme.outline
              : Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
    );
  }
}
