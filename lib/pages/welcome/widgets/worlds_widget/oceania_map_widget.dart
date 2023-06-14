import 'package:flutter/material.dart';
import 'set_city_position.dart';

// 亚洲
class OceaniaMapWidget extends StatelessWidget {
  const OceaniaMapWidget({
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
            'assets/weather_icon/world/dyz.jpg',
            fit: BoxFit.fill,
            width: screenWidth - (30 * ratio),
          ),
          Stack(
            children: [
              setCityPosition(context, 77, 58, 14, ratio, '达尔文'),
              setCityPosition(context, 233, 20, 11, ratio, '莫尔斯比港'),
              setCityPosition(context, 195, 117, 13, ratio, '布里斯班'),
              setCityPosition(context, 313, 114, 14, ratio, '苏瓦'),
              setCityPosition(context, 28, 166, 14, ratio, '珀斯'),
              setCityPosition(context, 198, 199, 14, ratio, '堪培拉'),
              setCityPosition(context, 238, 157, 14, ratio, '悉尼'),
              setCityPosition(context, 317, 209, 14, ratio, '惠灵顿'),
              setCityPosition(context, 188, 239, 14, ratio, '霍巴特'),
            ],
          ),
        ],
      ),
    );
  }
}
