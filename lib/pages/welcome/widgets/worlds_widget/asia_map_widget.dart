import 'package:flutter/material.dart';

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
              Positioned(
                left: 21 * ratio,
                top: 78 * ratio,
                child: Text(
                  '德黑兰',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 91 * ratio,
                top: 70 * ratio,
                child: Text(
                  '塔什干',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 203 * ratio,
                top: 37 * ratio,
                child: Text(
                  '乌兰巴托',
                  style: TextStyle(fontSize: (13 * ratio)),
                ),
              ),
              Positioned(
                left: 254 * ratio,
                top: 84 * ratio,
                child: Text(
                  '北京',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 323 * ratio,
                top: 65 * ratio,
                child: Text(
                  '首尔',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 332 * ratio,
                top: 104 * ratio,
                child: Text(
                  '东京',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 42 * ratio,
                top: 153 * ratio,
                child: Text(
                  '利雅得',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 117 * ratio,
                top: 110 * ratio,
                child: Text(
                  '新德里',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 120 * ratio,
                top: 212 * ratio,
                child: Text(
                  '马累',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 212 * ratio,
                top: 157 * ratio,
                child: Text(
                  '曼谷',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 292 * ratio,
                top: 174 * ratio,
                child: Text(
                  '马尼拉',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 245 * ratio,
                top: 233 * ratio,
                child: Text(
                  '雅加达',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
