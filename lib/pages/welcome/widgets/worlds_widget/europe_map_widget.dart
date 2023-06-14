import 'package:flutter/material.dart';
import 'set_city_position.dart';

// 欧洲
class EuropeMapWidget extends StatelessWidget {
  const EuropeMapWidget({
    super.key,
  });

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
            'assets/weather_icon/world/oz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              setCityPosition(context, 20, 23, 11, ratio, '雷克雅维克'),
              setCityPosition(context, 115, 75, 14, ratio, '奥斯陆'),
              setCityPosition(context, 50, 110, 14, ratio, '伦敦'),
              setCityPosition(context, 262, 82, 14, ratio, '莫斯科'),
              setCityPosition(context, 205, 127, 14, ratio, '华沙'),
              setCityPosition(context, 20, 226, 14, ratio, '马德里'),
              setCityPosition(context, 58, 165, 14, ratio, '巴黎'),
              setCityPosition(context, 131, 135, 14, ratio, '柏林'),
              setCityPosition(context, 122, 237, 14, ratio, '罗马'),
              setCityPosition(context, 134, 190, 14, ratio, '维也纳'),
              setCityPosition(context, 234, 185, 10, ratio, '布加勒斯特'),
              setCityPosition(context, 207, 238, 14, ratio, '雅典'),
            ],
          ),
        ],
      ),
    );
  }
}
