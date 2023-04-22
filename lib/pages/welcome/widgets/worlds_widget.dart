import 'package:flutter/material.dart';
import 'package:weather_app/pages/welcome/widgets/worlds_widget/index.dart';

const worlds = [
  AsiaMapWidget(),
  EuropeMapWidget(),
  NorthAmericaMapWidget(),
  SouthAmericaMapWidget(),
  OceaniaMapWidget(),
];

class WorldsWidget extends StatelessWidget {
  const WorldsWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return worlds.elementAt(index);
  }
}
