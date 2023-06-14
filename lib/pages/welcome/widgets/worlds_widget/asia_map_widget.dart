import 'package:flutter/material.dart';
import 'set_city_position.dart';

/// AsiaMapWidget
///
/// 亚洲 map widget
class AsiaMapWidget extends StatelessWidget {
  const AsiaMapWidget({
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
            'assets/weather_icon/world/yz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              setCityPosition(context, 21, 78, 14, ratio, '德黑兰'),
              setCityPosition(context, 91, 70, 14, ratio, '塔什干'),
              setCityPosition(context, 203, 37, 14, ratio, '乌兰巴托'),
              setCityPosition(context, 254, 84, 14, ratio, '北京'),
              setCityPosition(context, 323, 65, 14, ratio, '首尔'),
              setCityPosition(context, 332, 104, 14, ratio, '东京'),
              setCityPosition(context, 42, 153, 14, ratio, '利雅得'),
              setCityPosition(context, 117, 110, 14, ratio, '新德里'),
              setCityPosition(context, 120, 212, 14, ratio, '马累'),
              setCityPosition(context, 212, 157, 14, ratio, '曼谷'),
              setCityPosition(context, 292, 174, 14, ratio, '马尼拉'),
              setCityPosition(context, 245, 233, 14, ratio, '雅加达'),
            ],
          ),
        ],
      ),
    );
  }
}
