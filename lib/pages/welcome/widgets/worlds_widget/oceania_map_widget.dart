import 'package:flutter/material.dart';

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
              Positioned(
                left: 77 * ratio,
                top: 58 * ratio,
                child: Text(
                  '达尔文',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 233 * ratio,
                top: 20 * ratio,
                child: Text(
                  '莫尔斯比港',
                  style: TextStyle(fontSize: (11 * ratio)),
                ),
              ),
              Positioned(
                left: 195 * ratio,
                top: 117 * ratio,
                child: Text(
                  '布里斯班',
                  style: TextStyle(fontSize: (13 * ratio)),
                ),
              ),
              Positioned(
                left: 313 * ratio,
                top: 114 * ratio,
                child: Text(
                  '苏瓦',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 28 * ratio,
                top: 166 * ratio,
                child: Text(
                  '珀斯',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 198 * ratio,
                top: 199 * ratio,
                child: Text(
                  '堪培拉',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 238 * ratio,
                top: 157 * ratio,
                child: Text(
                  '悉尼',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 317 * ratio,
                top: 209 * ratio,
                child: Text(
                  '惠灵顿',
                  style: TextStyle(fontSize: (14 * ratio)),
                ),
              ),
              Positioned(
                left: 188 * ratio,
                top: 239 * ratio,
                child: Text(
                  '霍巴特',
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
