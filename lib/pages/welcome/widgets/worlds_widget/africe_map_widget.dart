import 'package:flutter/material.dart';
import 'set_city_position.dart';

class AfriceMapWidget extends StatelessWidget {
  const AfriceMapWidget({Key? key}) : super(key: key);

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
            'assets/weather_icon/world/fz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              setCityPosition(context, 115, 18, 14, ratio, '突尼斯'),
              setCityPosition(context, 217, 22, 14, ratio, '开罗'),
              setCityPosition(context, 40, 79, 14, ratio, '达喀尔'),
              setCityPosition(context, 149, 122, 14, ratio, '班吉'),
              setCityPosition(context, 197, 79, 13, ratio, '恩贾梅纳'),
              setCityPosition(context, 248, 133, 14, ratio, '内罗毕'),
              setCityPosition(context, 198, 184, 14, ratio, '哈拉雷'),
              setCityPosition(context, 147, 242, 14, ratio, '开普敦'),
              setCityPosition(context, 288, 218, 10, ratio, '塔那那利佛'),
            ],
          ),
        ],
      ),
    );
  }
}
