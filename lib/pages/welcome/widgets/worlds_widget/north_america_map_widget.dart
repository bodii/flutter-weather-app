import 'package:flutter/material.dart';
import 'set_city_position.dart';

class NorthAmericaMapWidget extends StatelessWidget {
  const NorthAmericaMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final ratio = screenWidth / 411;

    return Container(
      width: screenWidth,
      height: screenWidth - (100 * ratio),
      padding: EdgeInsets.all(15.0 * ratio),
      child: Stack(
        children: [
          Image.asset(
            'assets/weather_icon/world/bmz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              setCityPosition(context, 75, 92, 14, ratio, '温哥华'),
              setCityPosition(context, 133, 78, 13, ratio, '埃德蒙顿'),
              setCityPosition(context, 205, 103, 14, ratio, '渥太华'),
              setCityPosition(context, 264, 79, 13, ratio, '蒙特利尔'),
              setCityPosition(context, 279, 123, 14, ratio, '纽约'),
              setCityPosition(context, 62, 138, 14, ratio, '旧金山'),
              setCityPosition(context, 172, 205, 14, ratio, '休斯敦'),
              setCityPosition(context, 96, 182, 14, ratio, '洛杉矶'),
              setCityPosition(context, 177, 155, 14, ratio, '芝加哥'),
              setCityPosition(context, 255, 165, 14, ratio, '华盛顿'),
              setCityPosition(context, 260, 213, 14, ratio, '迈阿密'),
            ],
          ),
        ],
      ),
    );
  }
}
