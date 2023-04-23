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

  @override
  void initState() {
    super.initState();
    worldsPage.addListener(() {});
  }

  @override
  void dispose() {
    worldsPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 320,
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
          color: selected ? Colors.grey : Colors.grey.shade100,
        ),
      ),
    );
  }
}
