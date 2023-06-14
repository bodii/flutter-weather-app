import 'package:flutter/material.dart';
import 'set_city_position.dart';

class SouthAmericaMapWidget extends StatelessWidget {
  const SouthAmericaMapWidget({Key? key}) : super(key: key);

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
            'assets/weather_icon/world/nmz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              setCityPosition(context, 141, 12, 14, ratio, '波哥大'),
              setCityPosition(context, 208, 22, 14, ratio, '乔治敦'),
              setCityPosition(context, 111, 53, 14, ratio, '基多'),
              setCityPosition(context, 118, 97, 14, ratio, '利马'),
              setCityPosition(context, 179, 107, 14, ratio, '苏克雷'),
              setCityPosition(context, 239, 84, 13, ratio, '巴西利亚'),
              setCityPosition(context, 202, 149, 14, ratio, '亚松森'),
              setCityPosition(context, 113, 178, 13, ratio, '圣地亚哥'),
              setCityPosition(context, 198, 205, 8, ratio, '布宜诺斯艾利斯'),
            ],
          ),
        ],
      ),
    );
  }
}
